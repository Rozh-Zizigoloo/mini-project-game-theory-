import random

def evaluate_strategy(strategy):
    """
    Evaluate the expected delay cost for each user given a strategy.

    Args:
        strategy (list): The current strategy of all users.

    Returns:
        list: The expected delay costs for each user.
    """
    n = len(strategy)
    delay_costs = [0] * n

    for i in range(n):
        link_a_to_b_capacity = n / 100.0
        link_a_to_c_capacity = 45
        link_b_to_c_capacity = 1
        link_b_to_d_capacity = 45
        link_c_to_d_capacity = n / 100.0

        # Calculate traffic split based on strategy
        traffic_a_to_b = strategy[i][0]
        traffic_a_to_c = strategy[i][1]
        traffic_b_to_c = strategy[i][2]
        traffic_b_to_d = strategy[i][3]
        traffic_c_to_d = strategy[i][4]

        # Calculate effective capacities considering other users' traffic
        link_a_to_b_effective_capacity = link_a_to_b_capacity - sum([s[0] for s in strategy])
        link_a_to_c_effective_capacity = link_a_to_c_capacity - sum([s[1] for s in strategy])
        link_b_to_c_effective_capacity = link_b_to_c_capacity - sum([s[2] for s in strategy])
        link_b_to_d_effective_capacity = link_b_to_d_capacity - sum([s[3] for s in strategy])
        link_c_to_d_effective_capacity = link_c_to_d_capacity - sum([s[4] for s in strategy])

        # Calculate expected delay cost for each user
        if link_a_to_b_effective_capacity != 0:
            delay_a_to_b = traffic_a_to_b / link_a_to_b_effective_capacity
        else:
            # Handle the divide-by-zero case (e.g., assign a default value or raise an exception)
            delay_a_to_b = 0  # Assigning zero as an example
        if link_a_to_c_effective_capacity != 0:
            delay_a_to_c = traffic_a_to_c / link_a_to_c_effective_capacity
        else:
            delay_a_to_c = 0
        if link_b_to_c_effective_capacity != 0:
            delay_b_to_c = traffic_b_to_c / link_b_to_c_effective_capacity
        else:
            delay_b_to_c = 0
        if link_b_to_d_effective_capacity != 0:
            delay_b_to_d = traffic_b_to_d / link_b_to_d_effective_capacity
        else:
            delay_b_to_d = 0
        if link_c_to_d_effective_capacity != 0:
            delay_c_to_d = traffic_c_to_d / link_c_to_d_effective_capacity
        else:
             delay_b_to_d = 0

        delay_costs[i] = max(delay_a_to_b, delay_a_to_c, delay_b_to_c)

    return delay_costs


def best_response_dynamics(strategies, num_iterations):
    """
    Compute the Nash equilibrium using the best response dynamics algorithm.

    Args:
        strategies (list): Initial strategies of all users.
        num_iterations (int): Number of iterations to run the algorithm.

    Returns:
        list: The Nash equilibrium strategy profile.
    """
    n = len(strategies)

    for _ in range(num_iterations):
        new_strategies = [s[:] for s in strategies]

        for i in range(n):
            for j in range(5):
                # Compute the best response by minimizing expected delay cost
                new_strategy = strategies[i][:]
                new_strategy[j] = 1.0

                delay_costs_old = evaluate_strategy(new_strategies)
                delay_costs_new = evaluate_strategy([new_strategy])

                if delay_costs_new[0] < delay_costs_old[i]:
                    new_strategies[i] = new_strategy

        strategies = new_strategies
    return strategies


def main():
    # Initialize random strategies for 4000 users
    strategies = [[random.random() for _ in range(5)] for _ in range(4000)]
    num_iterations = 10

    # Compute the Nash equilibrium
    nash_equilibrium = best_response_dynamics(strategies, num_iterations)

    print("Nash Equilibrium Strategy Profile:")
    print(nash_equilibrium)


if __name__ == "__main__":
    main()
