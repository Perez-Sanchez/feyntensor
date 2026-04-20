var('N') 
import time
from sage.misc.sage_timeit import SageTimeitResult

V1=Graph({}, loops=True, multiedges=True, sparse=True)
V1Edges=[]
V1Edges +=[[0 ,1, 1]]
V1Edges +=[[2, 3, 1]]
V1Edges +=[[0, 3, 2]]
V1Edges +=[[2 ,1, 2]]
V1Edges +=[[0, 3, 3]]
V1Edges +=[[2 ,1, 3]]
V1.add_edges(V1Edges) ; V1

green_edges1 = [e for e in V1.edge_iterator() if e[2] == 1]
red_edges1 = [e for e in V1.edge_iterator() if e[2] == 2]
blue_edges1 = [e for e in V1.edge_iterator() if e[2] == 3]
V1.plot(edge_colors= {'red': red_edges1, 'blue':blue_edges1, 'green':green_edges1},figsize=(1.2, 1.2) )
# latex(V1.plot(edge_colors= {'red': red_edges, 'blue':blue_edges, 'green':green_edges},figsize=(1.2, 1.2) ))# can TeX export, not tikz

V2=Graph({}, loops=True, multiedges=True, sparse=True)
V2Edges=[]
V2Edges +=[[0 ,1, 2]]
V2Edges +=[[2, 3, 2]]
V2Edges +=[[0, 3, 1]]
V2Edges +=[[2 ,1, 1]]
V2Edges +=[[0, 3, 3]]
V2Edges +=[[2 ,1, 3]]
V2.add_edges(V2Edges) ; V2

green_edges2 = [e for e in V2.edge_iterator() if e[2] == 1]
red_edges2 = [e for e in V2.edge_iterator() if e[2] == 2]
blue_edges2 = [e for e in V2.edge_iterator() if e[2] == 3]
V2.plot(edge_colors= {'red': red_edges2, 'blue':blue_edges2, 'green':green_edges2},figsize=(1.2, 1.2) )
# latex(V1.plot(edge_colors= {'red': red_edges, 'blue':blue_edges, 'green':green_edges},figsize=(1.2, 1.2) ))# can TeX export, not tikz

V3=Graph({}, loops=True, multiedges=True, sparse=True)
V3Edges=[]
V3Edges +=[[0 ,1, 3]]
V3Edges +=[[2, 3, 3]]
V3Edges +=[[0, 3, 1]]
V3Edges +=[[2 ,1, 1]]
V3Edges +=[[0, 3, 2]]
V3Edges +=[[2 ,1, 2]]
V3.add_edges(V3Edges) ; V3
green_edges3 = [e for e in V3.edge_iterator() if e[2] == 1]
red_edges3 = [e for e in V3.edge_iterator() if e[2] == 2]
blue_edges3 = [e for e in V3.edge_iterator() if e[2] == 3]
V3.plot(edge_colors= {'red': red_edges3, 'blue':blue_edges3, 'green':green_edges3},figsize=(1.2, 1.2) )

K33=Graph({}, loops=True, multiedges=True, sparse=True)
K33Edges=[]
K33Edges +=[[0 ,1, 1]]
K33Edges +=[[2, 3, 1]]
K33Edges +=[[4, 5, 1]]
K33Edges +=[[0, 3, 2]]
K33Edges +=[[2 ,5, 2]]
K33Edges +=[[4 ,1, 2]]
K33Edges +=[[0, 5, 3]]
K33Edges +=[[2 ,1, 3]]
K33Edges +=[[4 ,3, 3]]

K33.add_edges(K33Edges) ; K33

E1=Graph({}, loops=True, multiedges=True, sparse=True)
E1Edges=[]
E1Edges +=[[0 ,1, 2]]
E1Edges +=[[2, 3, 2]]
E1Edges +=[[4, 5, 2]]
E1Edges +=[[0, 1, 1]]
E1Edges +=[[2 ,5, 1]]
E1Edges +=[[4 ,3, 1]]
E1Edges +=[[0, 5, 3]]
E1Edges +=[[2 ,1, 3]]
E1Edges +=[[4 ,3, 3]]
E1.add_edges(E1Edges) ; E1

E2=Graph({}, loops=True, multiedges=True, sparse=True)
E2Edges=[]
E2Edges +=[[0 ,1, 1]]
E2Edges +=[[2, 3, 1]]
E2Edges +=[[4, 5, 1]]
E2Edges +=[[0, 1, 2]]
E2Edges +=[[2 ,5, 2]]
E2Edges +=[[4 ,3, 2]]
E2Edges +=[[0, 5, 3]]
E2Edges +=[[2 ,1, 3]]
E2Edges +=[[4 ,3, 3]]
E2.add_edges(E2Edges) ; E2

E3=Graph({}, loops=True, multiedges=True, sparse=True)
E3Edges=[]
E3Edges +=[[0 ,1, 1]]
E3Edges +=[[2, 3, 1]]
E3Edges +=[[4, 5, 1]]
E3Edges +=[[0, 1, 3]]
E3Edges +=[[2 ,5, 3]]
E3Edges +=[[4 ,3, 3]]
E3Edges +=[[0, 5, 2]]
E3Edges +=[[2 ,1, 2]]
E3Edges +=[[4 ,3, 2]]
E3.add_edges(E3Edges) ; E3

Q1=Graph({}, loops=True, multiedges=True, sparse=True)
Q1Edges=[]
Q1Edges +=[[0 ,1, 2]]
Q1Edges +=[[0, 1, 3]]
Q1Edges +=[[2 ,3, 2]]
Q1Edges +=[[2, 3, 3]]
Q1Edges +=[[4 ,5, 2]]
Q1Edges +=[[4, 5, 3]]
Q1Edges +=[[5, 0, 1]]
Q1Edges +=[[4, 3, 1]]
Q1Edges +=[[2, 1, 1]]
Q1.add_edges(Q1Edges) ; Q1

Q2=Graph({}, loops=True, multiedges=True, sparse=True)
Q2Edges=[]
Q2Edges +=[[0 ,1, 3]]
Q2Edges +=[[0, 1, 1]]
Q2Edges +=[[2 ,3, 3]]
Q2Edges +=[[2, 3, 1]]
Q2Edges +=[[4 ,5, 3]]
Q2Edges +=[[4, 5, 1]]
Q2Edges +=[[5, 0, 2]]
Q2Edges +=[[4, 3, 2]]
Q2Edges +=[[2, 1, 2]]
Q2.add_edges(Q2Edges) ; Q2

Q3=Graph({}, loops=True, multiedges=True, sparse=True)
Q3Edges=[]
Q3Edges +=[[0 ,1, 2]]
Q3Edges +=[[0, 1, 1]]
Q3Edges +=[[2 ,3, 2]]
Q3Edges +=[[2, 3, 1]]
Q3Edges +=[[4 ,5, 2]]
Q3Edges +=[[4, 5, 1]]
Q3Edges +=[[5, 0, 3]]
Q3Edges +=[[4, 3, 3]]
Q3Edges +=[[2, 1, 3]]
Q3.add_edges(Q3Edges) ; Q3

# latex(V1.plot(edge_colors= {'red': red_edges, 'blue':blue_edges, 'green':green_edges},figsize=(1.2, 1.2) ))# can TeX export, not tikz

Mel=Graph({}, loops=True, multiedges=True, sparse=True)
MelEdges=[]
MelEdges +=[[0 ,1, 3]] 
MelEdges +=[[0, 1, 1]]  
MelEdges +=[[0 ,1, 2]]
Mel.add_edges(MelEdges) ; Mel

Cube=Graph({}, loops=True, multiedges=True, sparse=True)
CubeEdges=[]
CubeEdges +=[[0 ,1, 1]]
CubeEdges +=[[2, 3, 1]]
CubeEdges +=[[4, 5, 2]]
CubeEdges +=[[6, 7, 2]]
CubeEdges +=[[2 ,1, 2]]
CubeEdges +=[[0, 3, 2]]
CubeEdges +=[[6 ,5, 1]]
CubeEdges +=[[4 ,7, 1]]
CubeEdges +=[[3, 4, 3]]
CubeEdges +=[[5 ,0, 3]]
CubeEdges +=[[1 ,6, 3]]
CubeEdges +=[[2 ,7, 3]]

Cube.add_edges(CubeEdges) ; Cube

Y1=Graph({}, loops=True, multiedges=True, sparse=True)
Y1Edges = []
Y1Edges+= [[0,1,3]]
Y1Edges+= [[2,3,3]]
Y1Edges+= [[4,5,3]]
Y1Edges+= [[6,7,3]]
Y1Edges+= [[2,1,2]]
Y1Edges+= [[4,3,2]]
Y1Edges+= [[6,5,2]]
Y1Edges+= [[7,0,2]]
Y1Edges+= [[0,3,1]]
Y1Edges+= [[4,7,1]]
Y1Edges+= [[6,1,1]]
Y1Edges+= [[5,2,1]]
Y1.add_edges(Y1Edges) ; Y1

Y3=Graph({}, loops=True, multiedges=True, sparse=True)
Y3Edges = []
Y3Edges+= [[0,1,1]]
Y3Edges+= [[2,3,1]]
Y3Edges+= [[4,5,1]]
Y3Edges+= [[6,7,1]]
Y3Edges+= [[2,1,2]]
Y3Edges+= [[4,3,2]]
Y3Edges+= [[6,5,2]]
Y3Edges+= [[7,0,2]]
Y3Edges+= [[0,3,3]]
Y3Edges+= [[4,7,3]]
Y3Edges+= [[6,1,3]]
Y3Edges+= [[5,2,3]]
Y3.add_edges(Y3Edges) ; Y3

A2=Graph({}, loops=True, multiedges=True, sparse=True)
A2Edges = []
A2Edges+= [[0,1,1]]
A2Edges+= [[2,3,1]]
A2Edges+= [[4,5,1]]
A2Edges+= [[6,7,1]]
A2Edges+= [[2,1,2]]
A2Edges+= [[4,3,2]]
A2Edges+= [[6,5,2]]
A2Edges+= [[7,0,2]]
A2Edges+= [[0,1,3]]
A2Edges+= [[2,3,3]]
A2Edges+= [[4,5,3]]
A2Edges+= [[6,7,3]]
A2.add_edges(A2Edges) ; A2

A1=Graph({}, loops=True, multiedges=True, sparse=True)
A1Edges = []
A1Edges+= [[0,1,2]]
A1Edges+= [[2,3,2]]
A1Edges+= [[4,5,2]]
A1Edges+= [[6,7,2]]
A1Edges+= [[2,1,1]]
A1Edges+= [[4,3,1]]
A1Edges+= [[6,5,1]]
A1Edges+= [[7,0,1]]
A1Edges+= [[0,1,3]]
A1Edges+= [[2,3,3]]
A1Edges+= [[4,5,3]]
A1Edges+= [[6,7,3]]
A1.add_edges(A1Edges) ; A1
 
Cube_wInsertion=Graph({}, loops=True, multiedges=True, sparse=True)
Cube_wInsertionth=[]
Cube_wInsertionth +=[[0 ,1, 1]]
Cube_wInsertionth +=[[2, 3, 1]]
Cube_wInsertionth +=[[4, 5, 2]]
Cube_wInsertionth +=[[6, 7, 2]]
Cube_wInsertionth +=[[2 ,1, 2]]
Cube_wInsertionth +=[[0, 3, 2]]
Cube_wInsertionth +=[[6 ,5, 1]] 
Cube_wInsertionth +=[[3, 4, 3]]
Cube_wInsertionth +=[[5 ,0, 3]]
Cube_wInsertionth +=[[1 ,6, 3]]
Cube_wInsertionth +=[[2 ,7, 3]]
Cube_wInsertionth +=[[7 ,8, 1]]
Cube_wInsertionth +=[[4 ,9, 1]]
Cube_wInsertionth +=[[9 ,8, 2]]
Cube_wInsertionth +=[[9 ,8, 3]]

Cube_wInsertion.add_edges(Cube_wInsertionth) ;  Cube_wInsertion


Mel10=Graph({}, loops=True, multiedges=True, sparse=True)
Mel10th=[]
Mel10th +=[[0 ,1, 2]]
Mel10th +=[[2 ,3, 2]]
Mel10th +=[[4 ,5, 2]]
Mel10th +=[[6 ,7, 2]] 
Mel10th +=[[8 ,9, 2]]
Mel10th +=[[0 ,1, 3]]
Mel10th +=[[2 ,3, 3]]
Mel10th +=[[4 ,5, 3]]
Mel10th +=[[6 ,7, 3]] 
Mel10th +=[[8 ,9, 3]]
Mel10th +=[[0 +1 , 1+1, 1]]
Mel10th +=[[2 +1 , 1+3, 1]]
Mel10th +=[[4 +1 , 1+5, 1]]
Mel10th +=[[6 +1 , 1+7, 1]] 
Mel10th +=[[8 +1 , 0, 1]]

Mel10.add_edges(Mel10th) ;  Mel10


FishPillow10=Graph({}, loops=True, multiedges=True, sparse=True)
FishPillow10Edges=[]
FishPillow10Edges +=[[2, 3, 1]]

FishPillow10Edges +=[[0, 3, 3]]
FishPillow10Edges +=[[2 ,5, 3]]
FishPillow10Edges +=[[4 ,1, 3]]
FishPillow10Edges +=[[2 ,1, 2]]
FishPillow10Edges +=[[4 ,3, 2]]
FishPillow10Edges +=[[0, 5, 2]]
FishPillow10Edges +=[[4, 5, 1]]
# diples 
FishPillow10Edges +=[[0 ,7, 1]]
FishPillow10Edges +=[[6, 1, 1]]
FishPillow10Edges +=[[6, 9, 2]]
FishPillow10Edges +=[[8, 7, 2]]
FishPillow10Edges +=[[8, 9, 1]]
FishPillow10Edges +=[[8, 9, 3]]
FishPillow10Edges +=[[6, 7, 3]]

FishPillow10.add_edges(FishPillow10Edges) ; FishPillow10

FishV10=Graph({}, loops=True, multiedges=True, sparse=True)
FishV10Edges=[]
FishV10Edges +=[[2, 3, 1]]

FishV10Edges +=[[0, 3, 3]]
FishV10Edges +=[[2 ,5, 3]]
FishV10Edges +=[[4 ,1, 3]]
FishV10Edges +=[[2 ,1, 2]]
FishV10Edges +=[[4 ,3, 2]]
FishV10Edges +=[[0, 5, 2]]

# diples 
FishV10Edges +=[[0 ,7, 1]]
FishV10Edges +=[[4, 9, 1]]
FishV10Edges +=[[6, 1, 1]]
FishV10Edges +=[[8, 5, 1]]
FishV10Edges +=[[8, 9, 2]]
FishV10Edges +=[[8, 9, 3]]
FishV10Edges +=[[6, 7, 2]]
FishV10Edges +=[[6, 7, 3]]

FishV10.add_edges(FishV10Edges) ; FishV10

Fish10=Graph({}, loops=True, multiedges=True, sparse=True)
Fish10th=[]
Fish10th +=[[0 ,1, 2]]
Fish10th +=[[2 ,3, 2]]
Fish10th +=[[4 ,5, 2]]
Fish10th +=[[6 ,7, 2]] 
Fish10th +=[[8 ,9, 2]]
Fish10th +=[[0 ,3, 3]]
Fish10th +=[[2 ,5, 3]]
Fish10th +=[[4 ,1, 3]]
Fish10th +=[[6 ,7, 3]] 
Fish10th +=[[8 ,9, 3]]
Fish10th +=[[0 +1 , 1+1, 1]]
Fish10th +=[[2 +1 , 1+3, 1]]
Fish10th +=[[4 +1 , 1+5, 1]]
Fish10th +=[[6 +1 , 1+7, 1]] 
Fish10th +=[[8 +1 , 0, 1]]
Fish10.add_edges(Fish10th) ;  Fish10


HexDipole=Graph({}, loops=True, multiedges=True, sparse=True)
HexDipoleth=[]
HexDipoleth +=[[0 ,1, 2]] 
HexDipoleth +=[[1 ,2, 1]]
HexDipoleth +=[[3 ,4, 1]]
HexDipoleth +=[[4 ,5, 2]]
HexDipoleth +=[[0 ,3, 3]]
HexDipoleth +=[[2 ,5, 3]]
HexDipoleth +=[[4 ,1, 3]]
HexDipoleth +=[[0 ,5, 1]] 

# dipole 1
HexDipoleth +=[[7 ,2, 2]] 
HexDipoleth +=[[6 ,3, 2]] 
HexDipoleth +=[[6 ,7, 3]] 
HexDipoleth +=[[6 ,7, 1]] 

HexDipole.add_edges(HexDipoleth) ;  HexDipole

SymFish10=Graph({}, loops=True, multiedges=True, sparse=True)
SymFish10th=[]
SymFish10th +=[[0 ,1, 2]] 
SymFish10th +=[[1 ,2, 1]]
SymFish10th +=[[3 ,4, 1]]
SymFish10th +=[[4 ,5, 2]]
SymFish10th +=[[0 ,3, 3]]
SymFish10th +=[[2 ,5, 3]]
SymFish10th +=[[4 ,1, 3]]

# dipole 1
SymFish10th +=[[8 ,9, 2]]
SymFish10th +=[[8 ,9, 3]]
SymFish10th +=[[8 ,5, 1]]
SymFish10th +=[[9 ,0, 1]]

# dipole 2 
SymFish10th +=[[7 ,2, 2]] 
SymFish10th +=[[6 ,3, 2]] 
SymFish10th +=[[6 ,7, 3]] 
SymFish10th +=[[6 ,7, 1]] 

SymFish10.add_edges(SymFish10th) ;  SymFish10

FishEng10=Graph({}, loops=True, multiedges=True, sparse=True)
FishEng10Edges=[]
FishEng10Edges +=[[2, 3, 1]]
FishEng10Edges +=[[4, 5, 1]]
FishEng10Edges +=[[0, 3, 3]]
FishEng10Edges +=[[2 ,5, 3]]
FishEng10Edges +=[[4 ,1, 3]]
FishEng10Edges +=[[2 ,1, 2]]
FishEng10Edges +=[[4 ,3, 2]]

# diples 
FishEng10Edges +=[[0 ,7, 1]]
FishEng10Edges +=[[0, 9, 2]]
FishEng10Edges +=[[6, 1, 1]]
FishEng10Edges +=[[8, 5, 2]]
FishEng10Edges +=[[8, 9, 1]]
FishEng10Edges +=[[8, 9, 3]]
FishEng10Edges +=[[6, 7, 2]]
FishEng10Edges +=[[6, 7, 3]]

FishEng10.add_edges(FishEng10Edges) ; FishEng10


# this should be added to graphs intro...
DoppHex10=Graph({}, loops=True, multiedges=True, sparse=True)
DoppHex10Edges=[]

DoppHex10Edges +=[[0, 1, 1]] 
DoppHex10Edges +=[[2, 3, 1]]
DoppHex10Edges +=[[4, 5, 1]] 
DoppHex10Edges +=[[6, 7, 1]]
DoppHex10Edges +=[[8, 9, 1]] 

DoppHex10Edges +=[[2, 1, 2]] 
DoppHex10Edges +=[[4, 3, 2]]
DoppHex10Edges +=[[6, 5, 2]] 
DoppHex10Edges +=[[8, 7, 2]]
DoppHex10Edges +=[[0, 9, 2]]

DoppHex10Edges +=[[1, 8, 3]] 
DoppHex10Edges +=[[2, 9, 3]]
DoppHex10Edges +=[[3, 6, 3]] 
DoppHex10Edges +=[[4, 7, 3]]
DoppHex10Edges +=[[0, 5, 3]]  

DoppHex10.add_edges(DoppHex10Edges) ; DoppHex10

DoppHex10_c=DoppHex10.copy(immutable=True)

# temporary dictionary of omegas (Gurau-deg), here by hand.
# can be computed if new observables/input invariants are needed
# sage requires this to be immutable, hence the copy:
Mel_c = Mel.copy(immutable=True)
V1_c = V1.copy(immutable=True)
V2_c = V2.copy(immutable=True)
V3_c = V3.copy(immutable=True)
K33_c = K33.copy(immutable=True)
E1_c = E1.copy(immutable=True)
E2_c = E2.copy(immutable=True)
E3_c = E3.copy(immutable=True)
Q1_c = Q1.copy(immutable=True)
Q2_c = Q2.copy(immutable=True)
Q3_c = Q3.copy(immutable=True)
Cube_c = Cube.copy(immutable=True)
Cube_wInsertion_c =Cube_wInsertion.copy(immutable=True)
Y3_c = Y3.copy(immutable=True)
Y1_c = Y1.copy(immutable=True)
A1_c = A1.copy(immutable=True)
A2_c = A2.copy(immutable=True)
HexDipole_c = HexDipole.copy(immutable=True)
Mel10_c = Mel10.copy(immutable=True)
FishEng10_c=FishEng10.copy(immutable=True)
SymFish10_c = SymFish10.copy(immutable=True)
Fish10_c = Fish10.copy(immutable=True)
FishV10_c = FishV10.copy(immutable=True)
FishPillow10_c=FishPillow10.copy(immutable=True)

# The next list is still redundant. It suffices to type V1_c:0, and V2_c will have the same omega assigned (zero).
# This is not an error, as far as two different colored graphs that are not connected by 
# applying a color-permutation on the edges, have a different omega (e.g. Cube and Y1 are different
# graphs, and not connected by a color-permutation; but omega(Y) and omega(Cube) coincide, so we are fine.

omega = {Mel_c : 0 , V1_c:0, V2_c:0 ,V3_c:0, K33_c:1, E1_c:0, E2_c:0,A1_c:0 ,
         E3_c:0,Q1_c:0,Q3_c:0,Q2_c:0, Cube_c:1,Cube_wInsertion_c:1,Y3_c:1,Y1_c:1,A2_c:0,HexDipole_c:1,
         Mel10_c:0,Fish10_c:1,SymFish10_c:1,FishEng10_c:1,FishV10_c:1,FishPillow10_c:1,DoppHex10_c:2} 

# 