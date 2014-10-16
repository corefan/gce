--
-- Copyright (c) 2009-2014 Nous Xiong (348944179 at qq dot com)
--
-- Distributed under the Boost Software License, Version 1.0. (See accompanying
-- file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
--
-- See https://github.com/nousxiong/gce for latest version.
--

require("gce")

gce.run_actor(
  function ()
  	local sender, args = gce.recv("init", gce.aid())
		base_aid = args[1]

		while true do
			local aid, args, m = gce.recv()
			local ty = m:get_type()
			if ty:equals(gce.atom(2)) then
				break
			else
				gce.send(aid, 1)
			end
		end
		gce.send(base_aid)
  end)