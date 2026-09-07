;; easing functions for Fennel.
;;  based on AHEasing and Robert Penner's easing functions.

(local pi-over-2 (/ math.pi 2))
(local ease {})

(fn ease.none [t] t)

(fn ease.in-quad [t] (* t t))

(fn ease.out-quad [t] (- (* t (- t 2.0))))

(fn ease.in-out-quad [t]
 (if (< t 0.5) (* t t 2.0)
     (- (+ (* t t -2.0) (* t 4.0)) 1.0)))

(fn ease.in-cubic [t] (* t t t))

(fn ease.out-cubic [t]
 (let [f (- t 1.0)] (+ (* f f f) 1.0)))

(fn ease.in-out-cubic [t]
 (if (< t 0.5) (* t t t 4.0)
     (let [f (- (* t 2.0) 2.0)]
      (+ (* f f f 0.5) 1.0))))

(fn ease.in-quart [t] (* t t t t))

(fn ease.out-quart [t]
 (let [f (- t 1.0)] (+ (* f f f (- 1.0 t)) 1.0)))

(fn ease.in-out-quart [t]
 (if (< t 0.5) (* t t t t 8.0)
     (let [f (- t 1.0)]
      (+ (* f f f f -8.0) 1.0))))

(fn ease.in-quint [t] (* t t t t t))

(fn ease.out-quint [t]
 (let [f (- t 1.0)] (+ (* f f f f f) 1.0)))

(fn ease.in-out-quint [t]
 (if (< t 0.5) (* t t t t t 16.0)
     (let [f (- (* t 2.0) 2.0)]
      (+ (* f f f f f 0.5) 1.0))))

(fn ease.in-sine [t]
 (+ (math.sin (* (- t 1.0) pi-over-2)) 1.0))

(fn ease.out-sine [t]
 (math.sin (* t pi-over-2)))

(fn ease.in-out-sine [t]
 (* 0.5 (- 1.0 (math.cos (* t math.pi)))))

(fn ease.in-expo [t]
 (if (= 0.0 t) t
     (^ 2.0 (* 10.0 (- t 1.0)))))

(fn ease.out-expo [t]
 (if (= 1.0 t) t
     (- 1.0 (^ 2.0 (* t -10.0)))))

(fn ease.in-out-expo [t]
 (if (or (= 0.0 t) (= 1.0 t)) t
     (< t 0.5)     (* 0.5 (^ 2.0 (- (* t 20.0) 10.0)))
                   (+ (* -0.5 (^ 2.0 (+ (* t -20.0) 10.0))) 1.0)))

(fn ease.in-circ [t]
 (- 1.0 (math.sqrt (- 1.0 (* t t)))))

(fn ease.out-circ [t]
 (math.sqrt (* (- 2.0 t) t)))

(fn ease.in-out-circ [t]
 (if (< t 0.5) (* 0.5 (- 1.0 (math.sqrt (- 1.0 (* 4.0 (* t t))))))
               (* 0.5 (+ 1.0 (math.sqrt (*
                                         (- (- (* 2.0 t) 3.0))
                                         (- (* 2.0 t) 1.0)))))))

(fn ease.in-elastic [t]
 (* (math.sin (* 13.0 pi-over-2 t))
    (^ 2.0 (* 10.0 (- t 1.0)))))

(fn ease.out-elastic [t]
 (+ (* (math.sin (* (- 13.0) pi-over-2 (+ t 1.0)))
       (^ 2.0 (* (- 10.0) t))) 1.0))

(fn ease.in-out-elastic [t]
 (if (< t 0.5) (* 0.5 (math.sin (* 13.0 pi-over-2 2.0 t))
                      (^ 2.0 (* 10.0 (- (* 2.0 t) 1.0))))
               (* 0.5 (+ (* (math.sin (* (- 13.0)
                                         pi-over-2
                                         (+ (- (* 2.0 t) 1.0) 1.0)))
                            (^ 2.0 (* (- 10.0)
                                             (- (* 2.0 t) 1.0))))
                       2.0))))

(fn ease.in-back [t]
 (- (* t t t) (* t (math.sin (* t math.pi)))))

(fn ease.out-back [t]
 (let [f (- 1.0 t)]
  (- 1.0 (- (* f f f) (* f (math.sin (* f math.pi)))))))

(fn ease.in-out-back [t]
 (if (< t 0.5) (let [f (* t 2.0)]
                (* 0.5 (- (* f f f) (* f (math.sin (* f math.pi))))))
               (let [f (- 1.0 (- (* 2.0 t) 1.0))]
                (+ 0.5 (* 0.5 (- 1.0 (- (* f f f) (* f (math.sin (* f math.pi))))))))))

(fn ease.out-bounce [t]
 (if (< t (/ 4.0 11.0)) (/ (* 121.0 t t) 16.0)
     (< t (/ 8.0 11.0)) (+ (- (* (/ 363.0 40.0) t t)
                              (* (/ 99.0 10.0) t))
                           (/ 17.0 5.0))
     (< t (/ 9.0 10.0)) (+ (- (* (/ 4356.0 361.0) t t)
                              (* (/ 35442.0 1805.0) t))
                           (/ 16061.0 1805.0))
                        (+ (- (* (/ 54.0 5.0) t t)
                              (* (/ 513.0 25.0) t))
                           (/ 268.0 25.0))))

(fn ease.in-bounce [t]
 (- 1.0 (ease.out-bounce (- 1.0 t))))

(fn ease.in-out-bounce [t]
 (if (< t 0.5) (* 0.5 (ease.in-bounce (* t 2.0)))
               (+ 0.5 (* 0.5 (ease.out-bounce (- (* t 2.0) 1.0))))))


ease
