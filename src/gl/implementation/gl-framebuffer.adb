--------------------------------------------------------------------------------
-- Copyright (c) 2013, Felix Krause <contact@flyx.org>
--
-- Permission to use, copy, modify, and/or distribute this software for any
-- purpose with or without fee is hereby granted, provided that the above
-- copyright notice and this permission notice appear in all copies.
--
-- THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
-- WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
-- MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
-- ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-- WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-- ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-- OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
--------------------------------------------------------------------------------

with GL.API;
with GL.Enums;
with GL.Low_Level;

package body GL.Framebuffer is

   procedure Set_Clamp_Read_Color (Enabled : Boolean) is
   begin
      API.Clamp_Color (Enums.Clamp_Read_Color, Low_Level.Bool (Enabled));
   end Set_Clamp_Read_Color;

   procedure Read_Pixels (X, Y : Int;
                          Width, Height : Size;
                          Format : Pixels.Format;
                          Data_Type : Pixels.Data_Type;
                          Data : Array_Type) is
   begin
      API.Read_Pixels
        (X, Y, Width, Height, Format, Data_Type, Data (Data'First)'Address);
      Raise_Exception_On_OpenGL_Error;
   end Read_Pixels;

end GL.Framebuffer;