-------------------------------------------------------------------------------
-- lu-table_spec.lua for lua-utils                                           --
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
-- Unit tests for lu-table functions
-- }}}

--- lu-table_spec -- {{{

local lu_table = require('lu-table')
local rtable   = table

describe("lua-utils.table tests", function ()
  describe("remove_blanks tests", function ()
    it("should not change a table with no blanks", function ()
      local t  = {"foo", "bar", true }
      local t2 = lu_table.remove_blanks(t)

      assert.are.same(3, rtable.getn(t2))
      
      assert.are.same("foo", t2[1])
      assert.are.same("bar", t2[2])
      assert.are.same(true,  t2[3])      
    end)

    it("should remove the middle empty string", function ()
      local t  = {"foo","","bar"}
      local t2 = lu_table.remove_blanks(t)

      assert.are.same(2, rtable.getn(t2))
      assert.are.same("foo", t2[1])
      assert.are.same("bar", t2[2])
    end)

    it("should remove nil elements", function ()
      local t  = {nil, "foo", nil}
      local t2 = lu_table.remove_blanks(t)

      assert.are.same(1, rtable.getn(t2))
      assert.are.same("foo", t2[1])
    end)

    it("should remove all elements", function ()
      local t  = {nil, "", nil, ""}
      local t2 = lu_table.remove_blanks(t)

      assert.are.same(0, rtable.getn(t2))      
    end)
  end)

  describe("map tests", function ()
    it("should add 2 to every element of 1 through 10", function ()
      local t  = {1,2,3,4,5,6,7,8,9,10}
      local t2 = map(t, function (x) return x + 2 end)

      for x=1,10 do
         assert.are.same(x+2, t2[x])
      end
    end)                
  end)
end)

-- }}}
