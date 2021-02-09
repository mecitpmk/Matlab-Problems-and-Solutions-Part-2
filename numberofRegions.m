function [nRegs, maxRegs] = numberofRegions(X)
    RowSize = size(X);
    RowSize = RowSize(1);
    ColSize = size(X);
    ColSize = ColSize(2);
    testR = 0;
    testM = 0;
    for row=1:RowSize
        for col=1:ColSize
            if (X(row,col) ~= 0)
                testR = testR +1;
                [X,dimensionMTRX] = recursFunct(X,row,col);
                if (testM < dimensionMTRX)
                    testM = dimensionMTRX;
                end
            else
                continue;
            end
        end
    end
    nRegs = testR;
    maxRegs = testM;
end

    function [MATRX,dimensionMTRX] = recursFunct(MATRX,xAxis,yAxis)
        row = size(MATRX);
        row = row(1);
        col = size(MATRX);
        col = col(2);
        dimensionMTRX = 0;
        if ((xAxis~=0)&&(yAxis ~= 0)&&(yAxis<=col)&&(xAxis<=row))
            if MATRX(xAxis,yAxis) ~= 0
                MATRX(xAxis,yAxis) = 0;
                dimensionMTRX = dimensionMTRX+1;
                [MATRX,CheckO] = recursFunct(MATRX,xAxis,yAxis+1);
                dimensionMTRX = dimensionMTRX+CheckO;
                [MATRX,CheckO] = recursFunct(MATRX,xAxis+1,yAxis);
                dimensionMTRX = dimensionMTRX+CheckO;
                [MATRX,CheckO] = recursFunct(MATRX, xAxis-1,yAxis+1);
                dimensionMTRX = dimensionMTRX+CheckO;
                [MATRX,CheckO] = recursFunct(MATRX,xAxis+1,yAxis-1);
                dimensionMTRX = dimensionMTRX+CheckO;
                [MATRX,CheckO] = recursFunct(MATRX,xAxis+1,yAxis+1);
                dimensionMTRX = dimensionMTRX+CheckO;
                [MATRX,CheckO] = recursFunct(MATRX,xAxis-1,yAxis-1);
                dimensionMTRX = dimensionMTRX+CheckO;
                [MATRX,CheckO] = recursFunct(MATRX,xAxis-1,yAxis);
                dimensionMTRX = dimensionMTRX+CheckO;
                [MATRX,CheckO] = recursFunct(MATRX,xAxis,yAxis-1);
                dimensionMTRX = dimensionMTRX+CheckO;
            end
        end
    end