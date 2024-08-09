using System;
using System.Runtime.InteropServices;

class Program
{
  [DllImport("ATOM.dll", CallingConvention = CallingConvention.Cdecl)]
  public static extern IntPtr CreateAtom();

  [DllImport("ATOM.dll", CallingConvention = CallingConvention.Cdecl)]
  public static extern void DestroyAtom(IntPtr atom);

  [DllImport("ATOM.dll", CallingConvention = CallingConvention.Cdecl)]
  public static extern void InitializeAtom(IntPtr atom);

  [DllImport("ATOM.dll", CallingConvention = CallingConvention.Cdecl)]
  public static extern void DisplayMessageAtom(IntPtr atom, string message);

  static void Main()
  {
    IntPtr atom = CreateAtom();
    InitializeAtom(atom);
    DisplayMessageAtom(atom, "Bonjour depuis C++ !");
    DestroyAtom(atom);
  }
}
