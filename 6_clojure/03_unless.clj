(use 'clojure.test)

(defmacro unless [condition true_body false_body]
  (list 'if condition false_body true_body))

(deftest unless-test
  (is (= true (unless true false true)))
  (is (= true (unless false true false)))
  (is (= true (unless false true false)))
  (is (= true (unless true false true))))