package debop4s.core.concurrent

import java.util.concurrent.ConcurrentHashMap

import scala.collection.JavaConversions._
import scala.collection.mutable

/*
 * A bijection that may be modified and accessed simultaneously.
 * Note that we can allow only one modification at a time.
 * Updates need to be serialized to ensure that the bijective property is maintained.
 */
class ConcurrentBijection[@miniboxed A, @miniboxed B] extends mutable.Map[A, B] {

  val forward: ConcurrentHashMap[A, B] = new ConcurrentHashMap[A, B]()
  val reverse: ConcurrentHashMap[B, A] = new ConcurrentHashMap[B, A]()

  def toOpt[@miniboxed T](x: T): Option[T] = if (x == null) None else Some(x)

  def -=(key: A): this.type = {
    synchronized {
      val value = forward.remove(key)
      if (value != null)
        reverse.remove(value)
    }
    this
  }

  def +=(elem: (A, B)): this.type = {
    elem match {
      case (key, value) => update(key, value)
    }
    this
  }

  override def update(key: A, value: B): Unit = synchronized {
    // We need to update:
    //
    //    a -> b
    //    b -> a
    //
    // There may be existing mappings:
    //
    //   a  -> b'
    //   b' -> a
    //
    // or
    //
    //   a' -> b
    //   b  -> a'
    //
    // So we need to ensure these are killed.
    val oldValue = forward.put(key, value)
    if (oldValue != value) {
      if (oldValue != null) {
        // Remove the old reverse mapping.
        val keyForOldValue = reverse.remove(oldValue)
        if (key != keyForOldValue)
          forward.remove(keyForOldValue)
      }

      val oldKeyForValue = reverse.put(value, key)
      if (oldKeyForValue != null)
        forward.remove(oldKeyForValue)
    }
  }

  override def size: Int = forward.size()

  def get(key: A): Option[B] = toOpt(forward.get(key))

  def getReverse(value: B): Option[A] = toOpt(reverse.get(value))

  def iterator: Iterator[(A, B)] = forward.entrySet.iterator.map(e => (e.getKey, e.getValue))
}
