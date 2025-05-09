package funkin.util;

import funkin.util.tools.FloatTools;
import haxe.Timer;

class TimerUtil
{
  /**
   * Store the current time.
   */
  public static function start():Float
  {
    return Timer.stamp();
  }

  /**
   * Return the elapsed time.
   */
  static function took(start:Float, ?end:Float):Float
  {
    var endOrNow:Float = end != null ? end : Timer.stamp();
    return endOrNow - start;
  }

  /**
   * Return the elapsed time in seconds as a string.
   * @param start The start time.
   * @param end The end time.
   * @param precision The number of decimal places to round to.
   * @return The elapsed time in seconds as a string.
   */
  public static function seconds(start:Float, ?end:Float, ?precision = 2):String
  {
    var seconds:Float = FloatTools.round(took(start, end), precision);
    return '${seconds} seconds';
  }

  /**
   * Return the elapsed time in milliseconds as a string.
   * @param start The start time.
   * @param end The end time.
   * @return The elapsed time in milliseconds as a string.
   */
  public static function ms(start:Float, ?end:Float):String
  {
    var seconds:Float = took(start, end);
    return '${seconds * 1000} ms';
  }

  /**
   * Format seconds as minutes and hours with a colon, an optionally with milliseconds too.
   * @param	seconds		The number of seconds (for example, time remaining, time spent, etc).
   * @param	showMS		Whether to show milliseconds after a "." as well.  Default value is false.
   * @param	extraZeros Adds extra zeros to the timer like this "04:34" or this "04:34:11".
   * @return	A nicely formatted String, like "1:03".
   */
  public static function formatTime(seconds:Float, showMS:Bool = false, extraZeros:Bool = false):String
  {
    var trueSeconds:Float = seconds;
    var timeString:String = "";

    if (trueSeconds < 0)
    {
      timeString += "-";
      trueSeconds = -trueSeconds;
    }

    var timeSeconds:Int = Std.int(trueSeconds) % 60;
    var timeMinutes:Int = Std.int((Std.int(trueSeconds) / 60) % 60);
    var timeHours:Int = Std.int(Std.int(trueSeconds) / 3600);

    if (timeHours > 0)
    {
      if (timeHours < 10 && extraZeros)
      {
        timeString += 0;
      }
      timeString += timeHours + ":";
    }

    if (timeMinutes < 10 && (timeHours > 0 || extraZeros))
    {
      timeString += "0";
    }
    timeString += timeMinutes + ":";

    if (timeSeconds < 10)
    {
      timeString += "0";
    }
    timeString += timeSeconds;

    if (showMS)
    {
      timeString += ".";
      var timeMS:Int = Std.int((trueSeconds - Std.int(trueSeconds)) * 100);
      if (timeMS < 10)
      {
        timeString += "0";
      }
      timeString += timeMS;
    }

    return timeString;
  }
}
