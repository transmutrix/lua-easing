-- easing functions for MoonScript
--  based on AHEasing and Robert Penner's easing functions.

pi_over_2 = (math.pi / 2)
ease = {}

ease.none = (t) -> t

ease.in_quad = (t) -> (t * t)

ease.out_quad = (t) -> -(t * (t - 2.0))

ease.in_out_quad = (t) ->
  if t < 0.5
    t * t * 2.0
  else
    ((t * t * -2.0) + (t * 4.0)) - 1.0

ease.in_cubic = (t) -> (t * t * t)

ease.out_cubic = (t) ->
  f = (t - 1.0)
  ((f * f * f) + 1.0)

ease.in_out_cubic = (t) ->
  if t < 0.5
    (t * t * t * 4.0)
  else
    f = ((t * 2.0) - 2.0)
    ((f * f * f * 0.5) + 1.0)

ease.in_quart = (t) -> (t * t * t * t)

ease.out_quart = (t) ->
  f = (t - 1.0)
  ((f * f * f * (1.0 - t)) + 1.0)

ease.in_out_quart = (t) ->
  if t < 0.5
    (t * t * t * t * 8.0)
  else
    f = (t - 1.0)
    ((f * f * f * f * -8.0) + 1.0)

ease.in_quint = (t) ->
  (t * t * t * t * t)

ease.out_quint = (t) ->
  f = (t - 1.0)
  ((f * f * f * f * f) + 1.0)

ease.in_out_quint = (t) ->
  if t < 0.5
    (t * t * t * t * t * 16.0)
  else
    f = ((t * 2.0) - 2.0)
    ((f * f * f * f * f * 0.5) + 1.0)

ease.in_sine = (t) ->
  (math.sin(((t - 1.0) * pi_over_2)) + 1.0)

ease.out_sine = (t) ->
  math.sin((t * pi_over_2))

ease.in_out_sine = (t) ->
  (0.5 * (1.0 - math.cos((t * math.pi))))

ease.in_expo = (t) ->
  if 0.0 == t
    t
  else
    (2.0 ^ (10.0 * (t - 1.0)))

ease.out_expo = (t) ->
  if 1.0 == t
    t
  else
    (1.0 - (2.0 ^ (t * -10.0)))

ease.in_out_expo = (t) ->
  if ((0.0 == t) or (1.0 == t))
    t
  elseif t < 0.5
    (0.5 * (2.0 ^ ((t * 20.0) - 10.0)))
  else
    ((-0.5 * (2.0 ^ ((t * -20.0) + 10.0))) + 1.0)

ease.in_circ = (t) ->
  (1.0 - math.sqrt((1.0 - (t * t))))

ease.out_circ = (t) ->
  math.sqrt(((2.0 - t) * t))

ease.in_out_circ = (t) ->
  if t < 0.5
    (0.5 * (1.0 - math.sqrt((1.0 - (4.0 * (t * t))))))
  else
    (0.5 * (1.0 + math.sqrt((( -((2.0 * t) - 3.0)) * ((2.0 * t) - 1.0)))))

ease.in_elastic = (t) ->
  (math.sin((13.0 * pi_over_2 * t)) * (2.0 ^ (10.0 * (t - 1.0))))

ease.out_elastic = (t) ->
  ((math.sin((-13.0 * pi_over_2 * (t + 1.0))) * (2.0 ^ (-10.0 * t))) + 1.0)

ease.in_out_elastic = (t) ->
  if t < 0.5
    (0.5 * math.sin((13.0 * pi_over_2 * 2.0 * t)) * (2.0 ^ (10.0 * ((2.0 * t) - 1.0))))
  else
    (0.5 * ((math.sin((-13.0 * pi_over_2 * (((2.0 * t) - 1.0) + 1.0))) * (2.0 ^ (-10.0 * ((2.0 * t) - 1.0)))) + 2.0))

ease.in_back = (t) ->
  ((t * t * t) - (t * math.sin((t * math.pi))))

ease.out_back = (t) ->
  f = (1.0 - t)
  (1.0 - ((f * f * f) - (f * math.sin((f * math.pi)))))

ease.in_out_back = (t) ->
  if t < 0.5
    f = (t * 2.0)
    (0.5 * ((f * f * f) - (f * math.sin((f * math.pi)))))
  else
    f = (1.0 - ((2.0 * t) - 1.0))
    (0.5 + (0.5 * (1.0 - ((f * f * f) - (f * math.sin((f * math.pi)))))))

ease.out_bounce = (t) ->
  if t < (4.0 / 11.0)
    ((121.0 * t * t) / 16.0)
  elseif t < (8.0 / 11.0)
    ((((363.0 / 40.0) * t * t) - ((99.0 / 10.0) * t)) + (17.0 / 5.0))
  elseif t < (9.0 / 10.0)
    ((((4356.0 / 361.0) * t * t) - ((35442.0 / 1805.0) * t)) + (16061.0 / 1805.0))
  else
    ((((54.0 / 5.0) * t * t) - ((513.0 / 25.0) * t)) + (268.0 / 25.0))

ease.in_bounce = (t) ->
  (1.0 - ease.out_bounce((1.0 - t)))

ease.in_out_bounce = (t) ->
  if t < 0.5
    (0.5 * ease.in_bounce((t * 2.0)))
  else
    (0.5 + (0.5 * ease.out_bounce(((t * 2.0) - 1.0))))

ease
