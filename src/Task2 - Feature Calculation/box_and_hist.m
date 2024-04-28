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

    hfig = figure;  % save the figure handle in a variable   

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


    %https://www.youtube.com/watch?v=wP3jjk1O18A
    fname = strcat('../../report/figures/', name, '.pdf');

    picturewidth = 30; % set this parameter and keep it forever
    hw_ratio = 0.65; % feel free to play with this ratio
    set(findall(hfig,'-property','FontSize'),'FontSize', 10) % adjust fontsize to your document

    set(findall(hfig,'-property','Interpreter'),'Interpreter','latex') 
    set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
    set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
    pos = get(hfig,'Position');
    set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
    print(hfig,fname,'-dpdf','-painters','-fillpage')

end