package funkin.play.scoring;

/**
 * A static class which holds any functions to manage the accuracy of the song.
 */
class SongAccuracy
{
  private static var rawAccuracy:Float = 0;
  private static var passedNotes:Int = 0;
  private static var accuracy:Float = 0;

  public static function getCurrentAccuracy():Float
  {
    return accuracy;
  }

  /**
   * adds accuracy to the average
   * @param percent a new accuracy to add.
   */
  public static function addToAccuracy(percent:Float):Void
  {
    if (percent < 0) percent = 0;
    if (percent > 100) percent = 100;
    rawAccuracy += percent;
    passedNotes += 1;
    accuracy = rawAccuracy / passedNotes;
  }

  /**
   * adds a passed note without altering the "rawAccuracy" variable
   */
  public static function addMissToAccuracy():Void
  {
    passedNotes += 1;
    accuracy = rawAccuracy / passedNotes;
  }

  public static function isPassedNotesZero():Bool
  {
    if (passedNotes <= 0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  public static function reset():Void
  {
    rawAccuracy = 0;
    passedNotes = 0;
    accuracy = 0;
  }
}
