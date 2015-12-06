-module(day4).

main(Key, CoinZeroes) ->
    find_coin(0, Key, CoinZeroes).

find_coin(Num, Key, CoinZeroes) ->
    Hash = make_hash(Num, Key),
    CoinStatus = case CoinZeroes of
                     5 -> is_coin_5(Hash);
                     6 -> is_coin_6(Hash)
                 end,
    case CoinStatus of
        true -> Num;
        false -> find_coin(Num + 1, Key, CoinZeroes)
    end.

make_hash(Num, Key) when is_integer(Num) ->
    String = Key ++ integer_to_list(Num),
    Binary = list_to_binary(String),
    crypto:hash(md5, Binary).

% For Part 1
is_coin_5(<<0, 0, N, _/binary>>) when N < 16 -> true;
is_coin_5(_) -> false.

% For Part 2
is_coin_6(<<0, 0, 0, _/binary>>) -> true;
is_coin_6(_) -> false.
