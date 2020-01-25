defmodule ExChange do
  @api_url1 "https://min-api.cryptocompare.com/data/price?"
  @api_url2 "https://min-api.cryptocompare.com/data/pricemulti?"
  @sym1 "fsym="
  @syms1 "fsyms="
  @sym2 "&tsyms="

  def single_check(val1, val2_list) when is_list(val2_list) do
    val2 = Enum.join(val2_list, ",")
    url = "#{@api_url1}#{@sym1}#{val1}#{@sym2}#{val2}"
    fetch(url)
  end

  def single_check(val1, val2) do
    url = "#{@api_url1}#{@sym1}#{val1}#{@sym2}#{val2}"
    fetch(url)
  end

  def multiple_check(val_list, val2_list) when is_list(val_list) and is_list(val2_list) do
    val1 = Enum.join(val_list, ",")
    val2 = Enum.join(val2_list, ",")
    url = "#{@api_url2}#{@syms1}#{val1}#{@sym2}#{val2}"
    fetch(url)
  end

  def multiple_check(val_list, val2) when is_list(val_list) do
    val1 = Enum.join(val_list, ",")
    url = "#{@api_url2}#{@syms1}#{val1}#{@sym2}#{val2}"
    fetch(url)
  end

  defp fetch(url), do: url |> HTTPoison.get() |> result()
  defp result({:ok, %{status_code: 200, body: result}}), do: result |> parse()
  defp result({:ok, %{status_code: 404}}), do: "Price not found"
  defp result({:ok, %{status_code: 502}}), do: "Bad Gateway Error"
  defp parse(data), do: Jason.decode!(data)
end
