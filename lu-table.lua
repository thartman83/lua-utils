-------------------------------------------------------------------------------
-- table.lua for lua-utils                                                   --
-- Copyright (c) 2017 Tom Hartman (thomas.lees.hartman@gmail.com)            --
--                                                                           --
-- This program is free software; you can redistribute it and/or             --
-- modify it under the terms of the GNU General Public License               --
-- as published by the Free Software Foundation; either version 2            --
-- of the License, or the License, or (at your option) any later             --
-- version.                                                                  --
--                                                                           --
-- This program is distributed in the hope that it will be useful,           --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of            --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             --
-- GNU General Public License for more details.                              --
-------------------------------------------------------------------------------

--- Commentary -- {{{
-- A library of common table functions for lua
-- }}}

local rtable = table

--- table -- {{{

--- remove_blanks -- {{{
----------------------------------------------------------------------
-- Returns a new table with all nil or blank ("") values removed
-- @param tbl table to remove blank values from
----------------------------------------------------------------------
function remove_blanks (tbl)
   local retval = {}
   for k, v  in pairs(tbl) do
      if v ~= "" and v ~= nil then
         if type(k) == "number" then
            rtable.insert(retval, v)
         else
            retval[k] = v
         end
      end
   end
   return retval
end
-- }}}

--- map -- {{{
----------------------------------------------------------------------
-- Applies a function to all elements of a table
-- @param tbl a table
-- @param func a function
----------------------------------------------------------------------
function map (tbl, func)
   local retval = {}
   for k,v in pairs(tbl) do
      local newval = func(v)
      if type(k) == "number" then
         rtable.insert(retval, newval)
      else
         retval[k] = newval
      end
   end
   return retval
end
-- }}}

--- first -- {{{
----------------------------------------------------------------------
-- Return the first element of the table
-- @param tbl table to take the first element from
----------------------------------------------------------------------
function first (tbl)
   return tbl[1]
end
-- }}}

--- rest -- {{{
----------------------------------------------------------------------
-- Return all the elements of the table except for the first.
-- @param tbl table to take all but the first element from
----------------------------------------------------------------------
function rest (tbl)
   local t = tbl
   table.remove(t,1)
   return t
end
-- }}}

return { remove_blanks = remove_blanks,
         map           = map          ,
         first         = first        ,
         car           = first        ,
         rest          = rest         ,
         cdr           = rest         ,
}

-- }}}
