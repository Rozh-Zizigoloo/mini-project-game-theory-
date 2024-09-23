% Define the payoff matrix
payoff_matrix = [6, 6; 7, 2; 2, 7; 0, 0];

% Set up CVX optimization problem
cvx_begin
    % Variables for the mixed strategies of Player A and Player B
    variables x(2) y(2)
    
    % Objective function (minimizing a dummy variable)
    minimize(0)
    
    % Constraints: probabilities sum to 1
    subject to
        sum(x) == 1
        sum(y) == 1
        
        % Payoff constraints: ensure that probabilities correspond to Nash equilibrium
        x(1)*payoff_matrix(1, 1) + x(2)*payoff_matrix(2, 1) >= x(1)*payoff_matrix(3, 1) + x(2)*payoff_matrix(4, 1)
        x(1)*payoff_matrix(1, 2) + x(2)*payoff_matrix(2, 2) >= x(1)*payoff_matrix(3, 2) + x(2)*payoff_matrix(4, 2)
        
        y(1)*payoff_matrix(1, 1) + y(2)*payoff_matrix(3, 1) >= y(1)*payoff_matrix(2, 1) + y(2)*payoff_matrix(4, 1)
        y(1)*payoff_matrix(1, 2) + y(2)*payoff_matrix(3, 2) >= y(1)*payoff_matrix(2, 2) + y(2)*payoff_matrix(4, 2)
cvx_end

% Plotting the polytope
figure;
hold on;
grid on;

% Draw the lines connecting the equilibria
plot([payoff_matrix(1, 2), payoff_matrix(3, 2)], [payoff_matrix(1, 1), payoff_matrix(3, 1)], 'r--');
plot([payoff_matrix(2, 2), payoff_matrix(4, 2)], [payoff_matrix(2, 1), payoff_matrix(4, 1)], 'r--');

% Plot the equilibria points
scatter(y(2), y(1), 'filled', 'MarkerFaceColor', 'blue');
scatter(payoff_matrix(:, 2), payoff_matrix(:, 1), 'filled', 'MarkerFaceColor', 'red');

% Set axis labels
xlabel('Player B Payoff');
ylabel('Player A Payoff');

% Set axis limits
xlim([-1, 8]);
ylim([-1, 8]);

% Add legend
legend('Equilibrium Lines', 'Equilibria', 'Location', 'northwest');

% Add text labels for equilibria
text(payoff_matrix(1, 2), payoff_matrix(1, 1), 'E1');
text(payoff_matrix(2, 2), payoff_matrix(2, 1), 'E2');
text(payoff_matrix(3, 2), payoff_matrix(3, 1), 'E3');
text(payoff_matrix(4, 2), payoff_matrix(4, 1), 'E4');

hold off;
% Define the payoff matrix
payoff_matrix = [6, 6; 7, 2; 2, 7; 0, 0];

% Set up CVX optimization problem
cvx_begin
    % Variables for the mixed strategies of Player A and Player B
    variables x(2) y(2)
    
    % Objective function (minimizing a dummy variable)
    minimize(0)
    
    % Constraints: probabilities sum to 1
    subject to
        sum(x) == 1
        sum(y) == 1
        
        % Payoff constraints: ensure that probabilities correspond to Nash equilibrium
        x(1)*payoff_matrix(1, 1) + x(2)*payoff_matrix(2, 1) >= x(1)*payoff_matrix(3, 1) + x(2)*payoff_matrix(4, 1)
        x(1)*payoff_matrix(1, 2) + x(2)*payoff_matrix(2, 2) >= x(1)*payoff_matrix(3, 2) + x(2)*payoff_matrix(4, 2)
        
        y(1)*payoff_matrix(1, 1) + y(2)*payoff_matrix(3, 1) >= y(1)*payoff_matrix(2, 1) + y(2)*payoff_matrix(4, 1)
        y(1)*payoff_matrix(1, 2) + y(2)*payoff_matrix(3, 2) >= y(1)*payoff_matrix(2, 2) + y(2)*payoff_matrix(4, 2)
cvx_end

% Plotting the polytope
figure;
hold on;
grid on;

% Draw the lines connecting the equilibria
plot([payoff_matrix(1, 2), payoff_matrix(3, 2)], [payoff_matrix(1, 1), payoff_matrix(3, 1)], 'r--');
plot([payoff_matrix(2, 2), payoff_matrix(4, 2)], [payoff_matrix(2, 1), payoff_matrix(4, 1)], 'r--');

% Plot the equilibria points
scatter(y(2), y(1), 'filled', 'MarkerFaceColor', 'blue');
scatter(payoff_matrix(:, 2), payoff_matrix(:, 1), 'filled', 'MarkerFaceColor', 'red');

% Set axis labels
xlabel('Player B Payoff');
ylabel('Player A Payoff');

% Set axis limits
xlim([-1, 8]);
ylim([-1, 8]);

% Add legend
legend('Equilibrium Lines', 'Equilibria', 'Location', 'northwest');

% Add text labels for equilibria
text(payoff_matrix(1, 2), payoff_matrix(1, 1), 'E1');
text(payoff_matrix(2, 2), payoff_matrix(2, 1), 'E2');
text(payoff_matrix(3, 2), payoff_matrix(3, 1), 'E3');
text(payoff_matrix(4, 2), payoff_matrix(4, 1), 'E4');

hold off;
