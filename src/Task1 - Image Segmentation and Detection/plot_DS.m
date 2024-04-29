function plot_DS(DS)
    % Plotting the bar graph
    hfig = figure;
    bar(DS);
    xlabel('Image Index');
    ylabel('Dice Similarity Score');
    title('Dice Similarity Score for Ball Images');
    ylim([0.8, 1]);

    fname = '../../report/figures/DS_bar_graph.pdf';

    picturewidth = 30; % set this parameter and keep it forever
    hw_ratio = 0.65; % feel free to play with this ratio
    set(findall(hfig,'-property','FontSize'),'FontSize', 22) % adjust fontsize to your document

    set(findall(hfig,'-property','Interpreter'),'Interpreter','latex') 
    set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
    set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
    pos = get(hfig,'Position');
    set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
    print(hfig,fname,'-dpdf','-vector','-fillpage')
end