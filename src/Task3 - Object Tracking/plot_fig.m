function plot_fig(x, y, na, nb, x_, y_) 
    hfig = figure;
    plot(x, y, 'r', 'LineWidth', 0.5);
    hold on;
    plot(na, nb, 'bx', 'MarkerSize', 5);
    plot(x_, y_, 'g', 'LineWidth', 0.5);
    legend('Real', 'Noisy', 'Estimated');
    xlabel('x');
    ylabel('y');
    title('Real, Noisy and Estimated Coordinates');
    hold off;

    fname = strcat('../../report/figures/kalman.pdf');

    picturewidth = 30; % set this parameter and keep it forever
    hw_ratio = 0.6; % feel free to play with this ratio
    set(findall(hfig,'-property','FontSize'),'FontSize', 20) % adjust fontsize to your document

    set(findall(hfig,'-property','Interpreter'),'Interpreter','latex') 
    set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
    set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
    pos = get(hfig,'Position');
    set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
    print(hfig,fname,'-dpdf','-vector','-fillpage')
end