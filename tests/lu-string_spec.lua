-------------------------------------------------------------------------------
-- lu-string_spec.lua for lua-utils tests                                    --
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
-- Unit tests for the strings library in lua-utils
-- }}}

local lu_string = require("lu-string")
local rtable    = table

--- stringUnit -- {{{

describe("lua-utils.string tests", function ()
  describe("lua-utils.string.lines tests", function ()


    it("should split `foo\nbar\nbaz' into {`foo',`bar',`baz'}", function ()
      local str = "foo\nbar\nbaz"
      local t   = lu_string.lines(str)

      assert.are.same(rtable.getn(t),3)
      assert.are.same("foo", t[1])
      assert.are.same("bar", t[2])
      assert.are.same("baz", t[3])
    end)

    it("should return {} if str is `'", function ()
      local t = lu_string.lines("")
      assert.are.same(0,rtable.getn(t))
    end)

    it("should return {`foo'} if str is `foo'", function ()
      local t = lu_string.lines("foo")
      assert.are.same(1, rtable.getn(t))
      assert.are.same("foo",t[1])
    end)
    
  end)
  
  describe("lua-utils.string.split tests", function ()
    it("should split `foo,bar,baz' into {`foo',`bar',`baz'} with `,' as the delimiter", function ()
      local str = "foo,bar,baz"
      local t   = lu_string.split(str, ",")
      
      assert.are.same(rtable.getn(t),3)
      assert.are.same("foo",t[1])
      assert.are.same("bar",t[2])
      assert.are.same("baz",t[3])
    end)

    it("should split `foo,bar,baz' into {`foo',`bar',`baz'} with the default delimiter", function ()
      local str = "foo,bar,baz"
      local t   = lu_string.split(str, ",")
      
      assert.are.same(rtable.getn(t),3)
      assert.are.same("foo",t[1])
      assert.are.same("bar",t[2])
      assert.are.same("baz",t[3])
    end)
    
    it("should return {} if str is `'", function ()
      local str = ""
      local t   = lu_string.split(str,",")

      assert.are.same(0,rtable.getn(t))      
    end)

    it("should split `foo,,baz' into {`foo',`',`baz' with `,' as the delimiter", function ()
      local str = "foo,,baz"
      local t   = lu_string.split(str, ",")

      assert.are.same(3, rtable.getn(t))
      assert.are.same("foo",t[1])
      assert.are.same("",   t[2])
      assert.are.same("baz",t[3])
    end)

    it("should split `foo,,baz' into {`foo',`bar'} with `,' as the delimiter and noblanks set to true",function ()
      local str = "foo,,bar"
      local t   = lu_string.split(str,",",true)

      assert.are.same(2,rtable.getn(t))
      assert.are.same("foo",t[1])
      assert.are.same("bar",t[2])
    end)
  end)
end)

-- }}}
