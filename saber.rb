puts (100..999).to_a.map {|n| n if n.to_s == n.to_s.reverse}.compact.inject([]) {|m, n| m << (100..999).map {|nn| n*nn}}.flatten.uniq.reject {|n| n.to_s != n.to_s.reverse}.sort.max
