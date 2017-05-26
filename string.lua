-------------------------------------------------------------------------------
-- string.lua for lua-utils                                                  --
-- Copyright (c) 2017 Tom Hartman (thartman@hudco.com)                       --
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
-- A library of common string functions for lua
-- }}}

--- string -- {{{

--- lines -- {{{
----------------------------------------------------------------------
-- Splits a string into a table of strings using newline and carriage
-- return as a delimiter, returns a table of strings
-- @param string to split into lines
----------------------------------------------------------------------
function lines (str)
   local t = {}
   local function helper(line) table.insert(t, line) return "" end
   helper((str:gsub("(.-)\r?\n", helper)))
   return t
end
-- }}}

--- split -- {{{
----------------------------------------------------------------------
-- Splits a string into a table of strings based on a given delimiter
-- @param str string to split
-- @param delim delimiter to use to split the string
-- @param noblanks if TRUE removes blanks from the resulting table
----------------------------------------------------------------------
local function split(str, delim, noblanks)   
   if str == nil then return {} end

   local t = {}
   local function helper(part)
      if not noblanks or (part ~= nil and part ~= "") then
         table.insert(t, part)
      end
      return ""
   end   
   helper((str:gsub("(.-)" .. delim, helper)))
   return t
end
-- }}}

-- }}}
