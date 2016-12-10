(ns main 
  (:gen-class
   :methods [^:static [handler [Object] Object]]))

(require 'athena-cmd.core)

(defn -handler 
  [obj] 
  (let [query (.get obj "query")]
    (athena-cmd.core/exec query)))

