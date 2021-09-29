// Creates a PolyobjectHandle for every polyobject in the map
class swwm_PolyobjectHandlePostProcessor: LevelPostProcessor
{
  protected void Apply(Name checksum, String mapname)
  {
    Array<int> pobjnums;
    Array<swwm_PolyobjectHandle> pobjhandles;

    // Make sure initialization doesn't happen when reentering a map
    if (Level.Time > 0)
      return;

    // Look for Polyobject StartSpots and create a handle for each
    for (int i = 0; i < GetThingCount(); i++)
    {
      // Ignore every thing that isn't a Polyobject StartSpot
      int ednum = GetThingEdNum(i);
      // [MK] hotfix for this to recognize hexen polyobjects
      if (gameinfo.gametype&GAME_Hexen)
      {
      	if (ednum == 3001) ednum = swwm_PolyobjectHandle.POTYP_NORMAL;
      	else if (ednum == 3002) ednum = swwm_PolyobjectHandle.POTYP_CRUSH;
      }
      if (ednum < swwm_PolyobjectHandle.POTYP_NORMAL || ednum > swwm_PolyobjectHandle.POTYP_HURT)
        continue;

      // Create a PolyobjectHandle
      swwm_PolyobjectHandle handle = swwm_PolyobjectHandle.Create();

      // Get polyobject number from StartSpot angle
      handle.PolyobjectNum = GetThingAngle(i);

      // Store StartSpot position
      Vector3 pos = GetThingPos(i);
      handle.StartSpotPos = pos.xy;
      handle.z = pos.z;

      // Store StartSpot type (normal, crush, hurt)
      handle.Type = ednum;

      // Append polyobject number and corresponding handle to the respective arrays
      pobjnums.Push(handle.PolyobjectNum);
      pobjhandles.Push(handle);
    }

    // Look for Polyobj_StartLine/Polyobj_ExplicitLine lines
    for (int i = 0; i < Level.Lines.Size(); i++)
    {
      Line line = Level.Lines[i];

      // Ignore every line that doesn't have a Polyobj_StartLine or Polyobj_ExplicitLine
      // line special
      if (line.Special != Polyobj_StartLine && line.Special != Polyobj_ExplicitLine)
        continue;

      // Get polyobject number
      // (Args[0] for both Polyobj_StartLine and Polyobj_ExplicitLine)
      int pobjnum = line.Args[0];

      // Find the array index of the corresponding handle
      int pobjhandleindex = pobjnums.Find(pobjnum);
      if (pobjhandleindex >= pobjnums.Size())
        continue;  // Polyobject doesn't have a corresponding StartSpot

      swwm_PolyobjectHandle handle = pobjhandles[pobjhandleindex];

      // Get mirror polyobject number
      // (Args[1] for Polyobj_StartLine, Args[2] for Polyobj_ExplicitLine)
      int mirrorpobjnum = line.Special == Polyobj_StartLine ? line.Args[1] : line.Args[2];
      if (mirrorpobjnum != 0)
      {
        // Find the array index of the mirror polyobject handle
        int mirrorpobjhandleindex = pobjnums.Find(mirrorpobjnum);
        if (mirrorpobjhandleindex < pobjnums.Size())
        {
          // Mirror polyobject handle exists, store it
          handle.Mirror = pobjhandles[mirrorpobjhandleindex];
        }
      }

      // Get sound sequence number and store it
      // (Args[2] for Polyobj_StartLine, Args[3] for Polyobj_ExplicitLine)
      int soundseq = line.Special == Polyobj_StartLine ? line.Args[2] : line.Args[3];
      handle.SoundSequenceNum = soundseq;

      // Store the line
      handle.StartLine = line;

      // [MK] the library doesn't store ALL lines belonging to the polyobject, but we need them
      handle.Lines.Push(line);

      // [MK] collect all connected lines if this is Polyobj_StartLine
      if ( line.Special != Polyobj_StartLine )
        continue;

      bool newlines;
      do
      {
        newlines = false;
        for (int j = 0; j < Level.Lines.Size(); j++)
        {
          Line linea = Level.Lines[j];
          if (handle.Lines.Find(linea) < handle.Lines.Size())
            continue;
          bool nomatches = true;
          for (int k = 0; k < handle.Lines.Size(); k++)
          {
            Line lineb = handle.Lines[k];
            if ((linea.v1 != lineb.v1) && (linea.v1 != lineb.v2) && (linea.v2 != lineb.v1) && (linea.v2 != lineb.v2))
              continue;
            nomatches = false;
            break;
          }
          if (nomatches)
            continue;
          newlines = true;
          handle.Lines.Push(linea);
        }
      }
      while (newlines);
    }
  }
}
