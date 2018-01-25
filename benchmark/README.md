### Benchmark Result

```bash
$ bundle exec ./hash_search.rb
```

```
Warming up --------------------------------------
              nested   193.159k i/100ms
               array    81.822k i/100ms
                hash    56.859k i/100ms
Calculating -------------------------------------
              nested      4.446M (± 7.6%) i/s -     22.213M in   5.032311s
               array      1.144M (± 7.3%) i/s -      5.728M in   5.039765s
                hash    725.800k (± 6.2%) i/s -      3.639M in   5.035571s
```
