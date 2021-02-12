function Feature_plot(H,cell_coords,index, base_path)
n = length(index);
clf
%ha = tight_subplot(1,length(markersTSNE),[0.03,0.01],[0.1 0.05],[0.08 0.05]);
for i = 1:n
        hFig = figure();
        color = H(index(i),:);pointsize = 4;
        scatter(cell_coords(:,1), cell_coords(:,2), pointsize, color(:),'filled');        
        title(['Factor ',num2str(index(i))],'FontName','Arial','FontSize',10);
        cmap = flipud(colormap(hot));
        cmap(1,:) = [0.9 0.9 0.9];
        colormap(cmap)
        set(gca,'Xtick',[]);set(gca,'Ytick',[]);box off
        % axis off
       % axis tight
      % axis([-40 38 -42 41])
        set(gca,'Xcolor','None');set(gca,'Ycolor','None');
        axis off
      	saveas(hFig, join([base_path, "factor_", i, ".pdf"], ""))
end
