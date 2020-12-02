with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Containers.Vectors;

procedure Main is
	package Integer_Vectors is new Ada.Containers.Vectors (Natural, Integer);

	use Integer_Vectors;

	-- Reads lines from an input file and returns an array of integers.
	function Read_Input_Lines (Input_File : File_Type) return Vector is
		N : Integer;
		V : Vector;
	begin

		while (not End_Of_File (Input_File)) loop
			Get (N);
			V.Append (N);
		end loop;

		return V;
	end Read_Input_Lines;

	-- NB: Pipe the input file to stdin (the website i used to run this on didn't let me 
	-- load multiple files.)
	Numbers : Vector := Read_Input_Lines (Standard_Input);
	N : Integer;
begin
	for I in 0 .. (Integer(Numbers.Length) - 1) loop
		N := Numbers.Element(I);
		for J in I + 1 .. (Integer(Numbers.Length) - 1) loop
			if (N + Numbers.Element(J) = 2020) then
				Put_Line (Integer'Image (N * Numbers.Element(J)));
				return;
			end if;
		end loop;
	end loop;

	Put_Line(Standard_Error, "Nothing Found!");
end Main;
