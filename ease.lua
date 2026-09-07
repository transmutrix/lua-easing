-- easing functions for Lua.
--  based on AHEasing and Robert Penner's easing functions.

local pi_over_2 = (math.pi / 2)
local ease = {}

function ease.none (t)
  return t
end

function ease.in_quad (t)
  return (t * t)
end

function ease.out_quad (t)
  return ( - (t * (t - 2.0)))
end

function ease.in_out_quad (t)
  if (t < 0.5) then
    return (t * t * 2.0)
  else
    return (((t * t * -2.0) + (t * 4.0)) - 1.0)
  end
end

function ease.in_cubic (t)
  return (t * t * t)
end

function ease.out_cubic (t)
  local f = (t - 1.0)
  return ((f * f * f) + 1.0)
end

function ease.in_out_cubic (t)
  if (t < 0.5) then
    return (t * t * t * 4.0)
  else
    local f = ((t * 2.0) - 2.0)
    return ((f * f * f * 0.5) + 1.0)
  end
end

function ease.in_quart (t)
  return (t * t * t * t)
end

function ease.out_quart (t)
  local f = (t - 1.0)
  return ((f * f * f * (1.0 - t)) + 1.0)
end

function ease.in_out_quart (t)
  if (t < 0.5) then
    return (t * t * t * t * 8.0)
  else
    local f = (t - 1.0)
    return ((f * f * f * f * -8.0) + 1.0)
  end
end

function ease.in_quint (t)
  return (t * t * t * t * t)
end

function ease.out_quint (t)
  local f = (t - 1.0)
  return ((f * f * f * f * f) + 1.0)
end

function ease.in_out_quint (t)
  if (t < 0.5) then
    return (t * t * t * t * t * 16.0)
  else
    local f = ((t * 2.0) - 2.0)
    return ((f * f * f * f * f * 0.5) + 1.0)
  end
end

function ease.in_sine (t)
  return (math.sin(((t - 1.0) * pi_over_2)) + 1.0)
end

function ease.out_sine (t)
  return math.sin((t * pi_over_2))
end

function ease.in_out_sine (t)
  return (0.5 * (1.0 - math.cos((t * math.pi))))
end

function ease.in_expo (t)
  if (0.0 == t) then
    return t
  else
    return (2.0 ^ (10.0 * (t - 1.0)))
  end
end

function ease.out_expo (t)
  if (1.0 == t) then
    return t
  else
    return (1.0 - (2.0 ^ (t * -10.0)))
  end
end

function ease.in_out_expo (t)
  if ((0.0 == t) or (1.0 == t)) then
    return t
  elseif (t < 0.5) then
    return (0.5 * (2.0 ^ ((t * 20.0) - 10.0)))
  else
    return ((-0.5 * (2.0 ^ ((t * -20.0) + 10.0))) + 1.0)
  end
end

function ease.in_circ (t)
  return (1.0 - math.sqrt((1.0 - (t * t))))
end

function ease.out_circ (t)
  return math.sqrt(((2.0 - t) * t))
end

function ease.in_out_circ (t)
  if (t < 0.5) then
    return (0.5 * (1.0 - math.sqrt((1.0 - (4.0 * (t * t))))))
  else
    return (0.5 * (1.0 + math.sqrt((( - ((2.0 * t) - 3.0)) * ((2.0 * t) - 1.0)))))
  end
end

function ease.in_elastic (t)
  return (math.sin((13.0 * pi_over_2 * t)) * (2.0 ^ (10.0 * (t - 1.0))))
end

function ease.out_elastic (t)
  return ((math.sin((( - 13.0) * pi_over_2 * (t + 1.0))) * (2.0 ^ (( - 10.0) * t))) + 1.0)
end

function ease.in_out_elastic (t)
  if (t < 0.5) then
    return (0.5 * math.sin((13.0 * pi_over_2 * 2.0 * t)) * (2.0 ^ (10.0 * ((2.0 * t) - 1.0))))
  else
    return (0.5 * ((math.sin((( - 13.0) * pi_over_2 * (((2.0 * t) - 1.0) + 1.0))) * (2.0 ^ (( - 10.0) * ((2.0 * t) - 1.0)))) + 2.0))
  end
end

function ease.in_back (t)
  return ((t * t * t) - (t * math.sin((t * math.pi))))
end

function ease.out_back (t)
  local f = (1.0 - t)
  return (1.0 - ((f * f * f) - (f * math.sin((f * math.pi)))))
end

function ease.in_out_back (t)
  if (t < 0.5) then
    local f = (t * 2.0)
    return (0.5 * ((f * f * f) - (f * math.sin((f * math.pi)))))
  else
    local f = (1.0 - ((2.0 * t) - 1.0))
    return (0.5 + (0.5 * (1.0 - ((f * f * f) - (f * math.sin((f * math.pi)))))))
  end
end

function ease.out_bounce (t)
  if (t < (4.0 / 11.0)) then
    return ((121.0 * t * t) / 16.0)
  elseif (t < (8.0 / 11.0)) then
    return ((((363.0 / 40.0) * t * t) - ((99.0 / 10.0) * t)) + (17.0 / 5.0))
  elseif (t < (9.0 / 10.0)) then
    return ((((4356.0 / 361.0) * t * t) - ((35442.0 / 1805.0) * t)) + (16061.0 / 1805.0))
  else
    return ((((54.0 / 5.0) * t * t) - ((513.0 / 25.0) * t)) + (268.0 / 25.0))
  end
end

function ease.in_bounce (t)
  return (1.0 - ease.out_bounce((1.0 - t)))
end

function ease.in_out_bounce (t)
  if (t < 0.5) then
    return (0.5 * ease.in_bounce((t * 2.0)))
  else
    return (0.5 + (0.5 * ease.out_bounce(((t * 2.0) - 1.0))))
  end
end

return ease
