(use 'clojure.test)

(defn collection-type [col]
  (if (list? col)
    :list
    (if (vector? col)
      :vector
      (if (map? col)
        :map
        :unknown))))

(deftest col-test
  (is (= :list (collection-type '())))
  (is (= :list (collection-type '(:a :b))))
  (is (= :vector (collection-type '[])))
  (is (= :vector (collection-type '[:a :b])))
  (is (= :map (collection-type '{})))
  (is (= :map (collection-type '{:a :b})))
  (is (= :unknown (collection-type ""))))