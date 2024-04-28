function plot_shapes(ball1, ball2, ball3)
    tennis_colour = [0.87 1.0 0.31];
    football_colour = [0.5 0.5 1];
    american_colour = [0.4 0.2 0.19];

    figure('Name', 'Shape Features');
    subplot(4, 2, 1);
    histogram(ball1.Solidity, 10, 'FaceColor', tennis_colour, 'EdgeColor', 'none');
    hold on;
    histogram(ball2.Solidity, 10, 'FaceColor', football_colour, 'EdgeColor', 'none');
    histogram(ball3.Solidity, 10, 'FaceColor', american_colour, 'EdgeColor', 'none');
    title('Solidity');
    legend('Tennis', 'Football', 'American');

    subplot(4, 2, 2); % Create a subplot for boxplots
    boxplot([ball3.Solidity, ball2.Solidity, ball1.Solidity], 'Orientation', 'horizontal', 'Labels', {'American Football', 'Football', 'Tennis'});
    hold off;


    subplot(4, 2, 3);
    histogram(ball1.Eccentricity, 10, 'FaceColor', tennis_colour, 'EdgeColor', 'none');
    hold on;
    histogram(ball2.Eccentricity, 10, 'FaceColor', football_colour, 'EdgeColor', 'none');
    histogram(ball3.Eccentricity, 10, 'FaceColor', american_colour, 'EdgeColor', 'none');
    title('Eccentricity');
    legend('Tennis', 'Football', 'American');
    hold off;

    subplot(4, 2, 4); % Create a subplot for boxplots
    boxplot([ball3.Eccentricity, ball2.Eccentricity, ball1.Eccentricity], 'Orientation', 'horizontal', 'Labels', {'American Football', 'Football', 'Tennis'});
    hold off;
    

    subplot(4, 2, 5);
    histogram(ball1.Circularity, 10, 'FaceColor', tennis_colour, 'EdgeColor', 'none');
    hold on;
    histogram(ball2.Circularity, 10, 'FaceColor', football_colour, 'EdgeColor', 'none');
    histogram(ball3.Circularity, 10, 'FaceColor', american_colour, 'EdgeColor', 'none');
    title('Circularity');
    legend('Tennis', 'Football', 'American');
    hold off;

    subplot(4, 2, 6); % Create a subplot for boxplots
    boxplot([ball3.Circularity, ball2.Circularity, ball1.Circularity], 'Orientation', 'horizontal', 'Labels', {'American Football', 'Football', 'Tennis'});
    hold off;
    

    subplot(4, 2, 7);
    histogram(ball1.NonCompactness, 10, 'FaceColor', tennis_colour, 'EdgeColor', 'none');
    hold on;
    histogram(ball2.NonCompactness, 10, 'FaceColor', football_colour, 'EdgeColor', 'none');
    histogram(ball3.NonCompactness, 10, 'FaceColor', american_colour, 'EdgeColor', 'none');
    title('Non-Compactness');
    legend('Tennis', 'Football', 'American');
    hold off;

    subplot(4, 2, 8); % Create a subplot for boxplots
    boxplot([ball3.NonCompactness, ball2.NonCompactness, ball1.NonCompactness], 'Orientation', 'horizontal', 'Labels', {'American Football', 'Football', 'Tennis'});
    hold off;
    
end