function box_and_hist(data_r, data_g, data_b, name)
    tennis_r = data_r{1};
    football_r = data_r{2};
    american_r = data_r{3};

    tennis_g = data_g{1};
    football_g = data_g{2};
    american_g = data_g{3};

    tennis_b = data_b{1};
    football_b = data_b{2};
    american_b = data_b{3};

    %(102, 56, 49)
    tennis_colour = [0.87 1.0 0.31];
    football_colour = [0.5 0.5 1];
    american_colour = [0.4 0.2 0.19];

    figure('Name', name);
    subplot(3, 2, 1);
    histogram(tennis_r, 10, 'FaceColor', tennis_colour, 'EdgeColor', 'none');
    hold on;
    histogram(football_r, 10, 'FaceColor', football_colour, 'EdgeColor', 'none');
    histogram(american_r, 10, 'FaceColor', american_colour, 'EdgeColor', 'none');
    title('ASM - Red Channel');
    legend('Tennis', 'Football', 'American');

    subplot(3, 2, 2); % Create a subplot for boxplots
    boxplot([american_r, football_r, tennis_r], 'Orientation', 'horizontal', 'Labels', {'American Football', 'Football', 'Tennis'});
    hold off;
    
    subplot(3, 2, 3);
    histogram(tennis_g, 10, 'FaceColor', tennis_colour, 'EdgeColor', 'none');
    hold on;
    histogram(football_g, 10, 'FaceColor', football_colour, 'EdgeColor', 'none');
    histogram(american_g, 10, 'FaceColor', american_colour, 'EdgeColor', 'none');
    title('Contrast - Green Channel');
    legend('Tennis', 'Football', 'American');

    subplot(3, 2, 4); % Create a subplot for boxplots
    boxplot([american_g, football_g, tennis_g], 'Orientation', 'horizontal', 'Labels', {'American Football', 'Football', 'Tennis'});
    hold off;

    subplot(3, 2, 5);
    histogram(tennis_b, 10, 'FaceColor', tennis_colour, 'EdgeColor', 'none');
    hold on;
    histogram(football_b, 10, 'FaceColor', football_colour, 'EdgeColor', 'none');
    histogram(american_b, 10, 'FaceColor', american_colour, 'EdgeColor', 'none');
    title('Correlation - Blue Channel');
    legend('Tennis', 'Football', 'American');

    subplot(3, 2, 6); % Create a subplot for boxplots
    boxplot([american_b, football_b, tennis_b], 'Orientation', 'horizontal', 'Labels', {'American Football', 'Football', 'Tennis'});
    hold off;

end