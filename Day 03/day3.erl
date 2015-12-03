-module(day3).

main(Input) ->
    Route = get_route(Input, [{0, 0}]),
    length(lists:usort(Route)).

main2(Input) ->
    {SantaInput, RobotInput} = split_input(Input),
    SantaRoute = get_route(SantaInput, [{0, 0}]),
    RobotRoute = get_route(RobotInput, [{0, 0}]),
    length(lists:usort(lists:merge(SantaRoute, RobotRoute))).

get_route([], Houses) -> Houses;
get_route([Instruction | Remain], Houses = [CurrentHouse | _]) ->
    NextHouse = get_next_house(Instruction, CurrentHouse),
    get_route(Remain, [NextHouse | Houses]).

get_next_house(Instruction, {X, Y}) ->
    case Instruction of
        $< -> {X - 1, Y};
        $> -> {X + 1, Y};
        $v -> {X, Y - 1};
        $^ -> {X, Y + 1}
    end.

split_input(Input) ->
    split_input(Input, [], [], santa).

split_input([], SantaInput, RobotInput, _) -> {lists:reverse(SantaInput), lists:reverse(RobotInput)};
split_input([Instruction | Remain], SantaInput, RobotInput, santa) -> split_input(Remain, [Instruction | SantaInput], RobotInput, robot);
split_input([Instruction | Remain], SantaInput, RobotInput, robot) -> split_input(Remain, SantaInput, [Instruction | RobotInput], santa).
