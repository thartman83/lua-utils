-------------------------------------------------------------------------------
-- stringUnit.lua for lua-utils tests                                        --
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
-- Unit tests for the strings library in lua-utils
-- }}}

local rtable = table

--- stringUnit -- {{{

describe("lua-utils.string tests", function ()
  describe("lua-utils.string.lines tests", function ()


    it("should split `foo\nbar\nbaz' into {`foo',`bar',`baz'", function ()
      local str = "foo\nbar\nbaz"
      local t = lines(str)

      assert.are.same(rtable.getn(t),3)
      assert.are.same(t[1], "foo")
      assert.are.same(t[2], "bar")
      assert.are.same(t[3], "baz")
    end)

    it("should return {} if str is `'", function ()
      local t = lines("")
      assert.are.same(rtable.getn(t),0)
    end)

    it("should return {`foo'} if str is `foo'", function ()
      local t = lines("foo")
      assert.are.same(rtable.getn(t),1)
      assert.are.same(t[1], "foo")
    end)
    
  end)

  
  describe("lua-utils.string.split tests", function ()
    local str = "foo,bar,baz"
              
  end)
end)

-- }}}
