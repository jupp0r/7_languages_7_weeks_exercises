(use 'clojure.test)

(defn big [st n]
  (> (.length st) n))

(deftest big-test
  (is (= false (big "" 0)))
  (is (= false (big "" 1)))
  (is (= true (big "abab" 3)))
  (is (= false (big "abab" 4)))
  (is (= false (big "abab" 5))))