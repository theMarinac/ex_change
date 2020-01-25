# ExChange

Usage:

- cryptocurrency

```elixir
  iex(1)> ExChange.single_check("BTC", "USD")
  %{"USD" => 8440.72}
  iex(2)> ExChange.single_check("BTC", ["USD", "EUR"])
  %{"EUR" => 7647.46, "USD" => 8440.19}
  iex(3)> ExChange.multiple_check(["BTC", "ETH"], "EUR")
  %{"BTC" => %{"EUR" => 7651.51}, "ETH" => %{"EUR" => 147.15}}
  iex(4)> ExChange.multiple_check(["BTC", "ETH"], ["EUR", "USD"])
  %{
    "BTC" => %{"EUR" => 7649.58, "USD" => 8439.69},
    "ETH" => %{"EUR" => 147.11, "USD" => 162.31}
  }
```

- money (not all currency)

```elixir
  iex(1)> ExChange.single_check("USD", "EUR")
  %{"EUR" => 0.9099}
  iex(2)> ExChange.single_check("USD", ["EUR", "CHF"])
  %{"CHF" => 0.9808, "EUR" => 0.9099}
  iex(3)> ExChange.multiple_check(["EUR", "USD"], "CHF")
  %{"EUR" => %{"CHF" => 1.082}, "USD" => %{"CHF" => 0.9808}}
  iex(4)> ExChange.multiple_check(["EUR", "USD"], ["CHF","CNY"])
  %{
    "EUR" => %{"CHF" => 1.083, "CNY" => 7.783},
    "USD" => %{"CHF" => 0.9819, "CNY" => 7.056}
  }
```

## Installation

Run `setup.sh`