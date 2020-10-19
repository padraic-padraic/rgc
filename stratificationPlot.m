function binnedZ = stratificationPlot( arborFileName, zRes )
%STRATIFICATIONPLOT Roska style box plot
%   Detailed explanation goes here
    cached_arbor_name=arborFileName(1:length(arborFileName)-4);
    zdist_file = strcat(cached_arbor_name, '-zdist.txt');
    fig_name = strcat(cached_arbor_name,'-statification.svg');
    zdist = dlmread(zdist_file);
    zdist = zdist(:,2);
    Xup = 120*zRes/2;
    coords = linspace(-1*Xup, Xup, 120);
%     indices = linspace(52, 81,81-51);
%     boxdefs = [1 5;6 9;10 13; 14 17;18 21;22 26; 27 30];
    boxdefs = zeros(7,2);
    for i=(0:9)
        offset=i*3;
        left = -10.5+offset;
        right = left+3;
        left_point = max(find(coords<left));
        right_point = min(find(coords>right));
        if i==0
            left_point = 1;
        elseif i==9
            right_point = 120;
        end
        boxdefs(i+1,1)=left_point; boxdefs(i+1,2)=right_point;
    end
    axes = [-12, 22, 0, 6];
    summed = zeros(size(boxdefs,1),1);
    for i=(1:size(boxdefs,1))
%         summed(i) = mean(zdist(indices(boxdefs(i,1)):indices(boxdefs(i,2))));
          summed(i) = sum(zdist(boxdefs(i,1):boxdefs(i,2)));
    end
    b_summed = flip(summed);
    b_summed = b_summed(1:10);
    threshold = mean(summed);
    bar(b_summed);
    thresh = line([0, 10], [threshold threshold], 'Color','red');
    saveas(gcf,strcat(cached_arbor_name,'-bar.png'));
    close;
    for i=(0:9)
        offset=i*3;
        rectangle('Position', [-10.5+offset,0.5,3,3], 'LineWidth',5);
        if summed(i+1)>threshold
            rectangle('Position', [-10.5+offset,0.5,3,3],'FaceColor',[ 0.63 0.63 0.63], 'EdgeColor', [0. 0. 0.], 'LineWidth', 5)
        end
    end
    set(gca,'Ytick',[]);
    ylim([0 6]);
    set(gca, 'FontSize',18);
    set(gca, 'XTick', [-12 0 10 20]);
    onl = line([0 0], [0.5 3.5], 'Color', 'green','LineStyle', '-', 'LineWidth', 10);
    offl = line([12 12], [0.5 3.5], 'Color', 'green', 'LineStyle', '-', 'LineWidth', 10);
    set(gcf, 'PaperOrientation', 'landscape');
    set(gcf, 'PaperPosition', [-3 0 35 7]);
    print(gcf,'-dsvg', fig_name);
    binnedZ = summed;
    close;
end
