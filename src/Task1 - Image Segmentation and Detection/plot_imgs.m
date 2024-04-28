function plot_imgs(imgs, name)
    GT_path = '../../data/ball_frames/ground_truth/';
    mask_path ='../../data/ball_frames/mask/';
    hfig = figure;

    for i = 1:5
        if strcmp(name, 'best')
            subplot(5, 2, i+(i-1));
            imshow([mask_path 'frame-' num2str(imgs(end-i+1)+53) '.png']);
            title(['Best Segmented Image ' num2str(imgs(end-i+1)+53)]);

            subplot(5, 2, i*2);
            imshow([GT_path 'frame-' num2str(imgs(end-i+1)+53) '_GT.png']);
            title(['GT Mask Image ' num2str(imgs(end-i+1)+53)]);
        elseif strcmp(name, 'worst')
            subplot(5, 2, i+(i-1));
            imshow([mask_path 'frame-' num2str(imgs(i)+53) '.png']);
            title(['Worst Segmented Image ' num2str(imgs(i)+53)]);

            subplot(5, 2, i*2);
            imshow([GT_path 'frame-' num2str(imgs(i)+53) '_GT.png']);
            title(['GT Mask Image ' num2str(imgs(i)+53)]);
        end
    end

    fname = strcat('../../report/figures/', name ,'.pdf');

    picturewidth = 30; % set this parameter and keep it forever
    hw_ratio = 1.4; % feel free to play with this ratio
    set(findall(hfig,'-property','FontSize'),'FontSize', 20) % adjust fontsize to your document

    set(findall(hfig,'-property','Interpreter'),'Interpreter','latex') 
    set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
    set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
    pos = get(hfig,'Position');
    set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
    print(hfig,fname,'-dpdf','-vector','-fillpage')
end