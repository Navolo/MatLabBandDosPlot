function []=PDosPlotFun2(savefilename)
global Material
filename=[savefilename, '.csv']; %给定文件名
delimiterIn = ',';
headerlinesIn = 0;
PhysicsVar = importdata(filename,delimiterIn,headerlinesIn);
PhyPhysicsVar1 = [PhysicsVar(:,1),PhysicsVar(:,5),PhysicsVar(:,9)...
    PhysicsVar(:,11),PhysicsVar(:,15),PhysicsVar(:,3),...
    PhysicsVar(:,7),PhysicsVar(:,11)];
PhyPhysicsVar2 = [PhysicsVar(:,2),PhysicsVar(:,6),PhysicsVar(:,10),...
    PhysicsVar(:,14),PhysicsVar(:,16),PhysicsVar(:,4),...
    PhysicsVar(:,8),PhysicsVar(:,12)];
% PhyPhysicsVar1 = [PhysicsVar(:,1),PhysicsVar(:,3),PhysicsVar(:,5),...
%     PhysicsVar(:,7),PhysicsVar(:,9)];
% PhyPhysicsVar2 = [PhysicsVar(:,2),PhysicsVar(:,4),PhysicsVar(:,6),...
%     PhysicsVar(:,8),PhysicsVar(:,10)];
% 对数据进行预处理，重新构成X矩阵和Y矩阵。由于d、f电子本次计算中没有参与，
% 暂时不予画出,下面图例处作相应改变
plot(PhyPhysicsVar1,PhyPhysicsVar2);
% Color=['g' 'm' 'b' 'c' 'w' 'r' 'k' 'y'];
% hold on;
% for i=1:8
% plot(PhyPhysicsVar1(:,i),PhyPhysicsVar2(:,i),Color(ceil(i/2)));
% end 
% ys循环方案指定作图
% get(gca,'ColorOrder')
%调用画图函数
% B = ceil(A) rounds the elements of A to 
% the nearest integers greater than or equal to A.
% For complex A, the imaginary and real parts are 
% rounded independently. 取顶函数参考
axis tight;
% ys使坐标轴紧致
% axis([0 1 -20 20]) v = axis
% 设定坐标系限度
set(gca,'Title',text('String',savefilename,'Interpreter','none',...
    'FontName','Times new roman','FontWeight','bold',...
    'Color','k','FontSize',25))
% 指定标题 标题格式 位置  以坐标轴大小为归一化
set(get(gca,'YLabel'),'String','Density of States(electrons/eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
set(get(gca,'XLabel'),'String','Energy(eV)'...
    ,'FontSize',15,'FontName','Times new roman','FontWeight','bold')
%  指定题目 纵坐标标记
hleg1 = legend('s','p','d','f');
% get(hleg1)
% hleg1 = legend('salpha','palpha','dalpha','falpha',...
%     'sbeta','pbeta','dbeta','fbeta');
%制定图例
% hleg1 = legend('s','p','d','f','sum');
set(hleg1,'Location','SouthWest')
set(hleg1,'Interpreter','none')
% 指定图例位置 翻译模块 即legend
text('String',Material,...
    'HorizontalAlignment','left',...
    'FontName','Times new roman','Color','k',...
    'FontSize',15,'Units','normalized','Position',[0.03 0.97])
% 指定物质

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [27 15]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'normalized');
set(gcf, 'PaperPosition', [0.03 0.05 0.94 0.9]);
saveas(gcf,savefilename,'png')
% 以上格式化输出
end
% ColorOrder=[0    0.4470    0.7410
%     0    0.4470    0.7410
%     0.8500    0.3250    0.0980
%     0.8500    0.3250    0.0980
%     0.9290    0.6940    0.1250
%     0.9290    0.6940    0.1250
%     0.4940    0.1840    0.5560
%     0.4940    0.1840    0.5560
%     0.4660    0.6740    0.1880
%     0.4660    0.6740    0.1880];
% set(groot,'defaultAxesColorOrder',ColorOrder)
% 
% h=groot
% get(h,'defaultAxesColorOrder')
% 
% co=[    0    0.4470    0.7410
%     0.8500    0.3250    0.0980
%     0.9290    0.6940    0.1250
%     0.4940    0.1840    0.5560
%     0.4660    0.6740    0.1880
%     0.3010    0.7450    0.9330
%     0.6350    0.0780    0.1840];
% set(groot,'defaultAxesColorOrder',co)
% 重置画图颜色默认设置