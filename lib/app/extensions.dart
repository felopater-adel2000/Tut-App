extension NonNullString on String?
{
  String orEmpty()
  {
    if(this == null)
      {
        return "--NA--";
      }
    else
      {
        return this!;
      }
  }
}

extension NonNullInt on int?
{
  int orZero()
  {
    if(this == null)
    {
      return 0;
    }
    else
    {
      return this!;
    }
  }
}


