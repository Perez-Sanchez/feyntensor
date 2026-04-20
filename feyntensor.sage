def marking_coloring(bubbles):
    """
    use: marking_coloring([V1,V2])[0][0].plot(  # the graph
    edge_colors=marking_coloring([V1,V2])[1][0],figsize=(1.2, 1.2) # colors to plot
    )
    """
    num_bubbles = []
    coloration = []
    bbl_sizes = list(map(len,bubbles))
    # bbl_sizes = bbl_sizes[:-1]
    
    for num,bbl in enumerate(bubbles):
  
        num_bbl = Graph({}, loops=True, multiedges=True, sparse=True) 
        # add number of procedence to each edge ; keep its colour 
        # renum_vertices =
        num_edges = [ (s+sum( bbl_sizes[:num]) +1 ,t+sum( bbl_sizes[:num]) +1,col) for s,t,col in  bbl.edges() ]
        num_bbl.add_edges(num_edges)
 
        green_edges = [e for e in num_bbl.edge_iterator() if e[2] == 1]
        red_edges = [e for e in num_bbl.edge_iterator() if e[2] == 2] 
        blue_edges = [e for e in num_bbl.edge_iterator() if e[2] == 3]
        
        num_bbl.plot()
        num_bubbles+= [ num_bbl ]
        coloration += [{'red': red_edges, 'blue':blue_edges, 'green':green_edges} ]
    return num_bubbles, coloration
  

def Integrate(bubbles):
    """ Connected Feynman diagrams. """
    marked_bubbles = marking_coloring(bubbles)[0]
    coloration_bubbles =  [] 
    all_vertex_set = []
    purecolored_edges = []
    to=time.time()
    ctr = 0
    grbloops = []
    amplitudes = 0
    cttime = 0
    names=''
    melons = []
    last_computed_pm=0
    
    bbl_sizes = list(map(len,bubbles)) 
    
    # immutable copy of bubble:
    bubbles_copy = [ bbl.copy(immutable=True) for bbl in bubbles ]
    for bbl in marking_coloring(bubbles)[0] :
        all_vertex_set += bbl.vertices()
        purecolored_edges += bbl.edges()
    # select conn. bip. matchings...
    ConnBipartiteMatchings = []
    degs=[]
    # list of Feynman graphs :
    Feynman_graphs  = [] 
    conn_counter =0 
    # next is the double factorial (2 #V - 1)!! :
    lpm = (len(all_vertex_set)-1).multifactorial(2)
 
    for grafo in bubbles:
        names+=str(grafo.num_verts())

    BPMs = load ('BPMs_%s_selfgenerated.sobj'%str(len(all_vertex_set )) )
    
    for num_pm,bpm in enumerate(BPMs) :
 
        GR = Graph({ }, loops=True, multiedges=True)
        GR.add_vertices(all_vertex_set)
        GR.add_edges(purecolored_edges)
        newedges0 = []
        # print(PM_red, 'is PMred')
        for i in range(len(bpm)) :
            ctr+=1 
            # print(i,list(bpm[i]), 'len bpm is', len(bpm),type(bpm) )
            newedges0 += [[list(bpm[i])[0],list(bpm[i])[1], 0]]
            GR.add_edges(newedges0)
              
        if GR.is_connected() : 
            # notationwise

            cbpm=bpm
            green_edges = [e for e in GR.edge_iterator() if e[2] == 1]
            red_edges = [e for e in GR.edge_iterator() if e[2] == 2] 
            blue_edges = [e for e in GR.edge_iterator() if e[2] == 3]
            PM_green = PerfectMatching ( [e[0:2] for e in GR.edge_iterator() if e[2] == 1] )
            PM_red = PerfectMatching ( [e[0:2]  for e in GR.edge_iterator() if e[2] == 2] )
            PM_blue = PerfectMatching ( [e[0:2]  for e in GR.edge_iterator() if e[2] == 3] )
            
            coloration_dict = [{'red': red_edges, 'blue':blue_edges, 'green':green_edges,'darkgray':newedges0}]
    
            Feynman_graphs += [GR]
            coloration_bubbles += [coloration_dict] 
            cbpm=PerfectMatching(cbpm)
            rl=cbpm.number_of_loops(PM_red)
            gl= cbpm.number_of_loops(PM_green)
            bl=cbpm.number_of_loops(PM_blue)
            deg = rl+gl+bl+  2*len(bubbles) - len(all_vertex_set) -3 \
                            + sum ( omega[bubbles_copy[ii]] for ii in range(len(bubbles)) )
            # this line are the Gurau degrees 
            # (Should be all, if models with nonmelonic # INTERACTION vertices are used
            # print(deg, type(deg))
            newamp= N^(deg)
            amplitudes+= newamp
            degs +=[deg]
            grbloops +=[ [gl,rl,bl] ]
            conn_counter+=1
            if deg == 0 :
                melons += [conn_counter-1]
            
                # print('melon, deg=', deg, ' at entry num_pm=', num_pm )
    #print('done, entries are: 0: Feynman grs, 1: colorations, 2: sum of amplitudes, 3: degrees, 4: melons, 5: grb loops')
    return amplitudes
  
def FeynmanGr(bubbles):
    """ Connected Feynman diagrams """
    marked_bubbles = marking_coloring(bubbles)[0]
    coloration_bubbles =  [] 
    all_vertex_set = []
    purecolored_edges = []
    to=time.time()
    ctr = 0
    ctrdg = 0
    amplitudes = 0
    cttime = 0
    names=''
    last_computed_pm=0
    
    bbl_sizes = list(map(len,bubbles)) 
    
    # immutable copy of bubble:
    bubbles_copy = [ bbl.copy(immutable=True) for bbl in bubbles ]
    for bbl in marking_coloring(bubbles)[0] :
        all_vertex_set += bbl.vertices()
        purecolored_edges += bbl.edges()
    # select conn. bip. matchings...
    ConnBipartiteMatchings = []
    
    # list of Feynman graphs :
    Feynman_graphs  = [] 
    
    # next is the double factorial (2 #V - 1)!! :
    lpm = (len(all_vertex_set)-1).multifactorial(2)
 
    for grafo in bubbles:
        names+=str(grafo.num_verts())
        path='conn_bipartitematchings_%s.sobj'%str(names)
    
    if os.path.exists(path) :
        # if file exists, then load until the last computed pm
        print('(Some or all) bipartite matchings had been computed before, I\'m reading them') 
        Feynman_graphs, coloration_bubbles, ConnBipartiteMatchings,last_computed_pm, amplitudes\
        = load('conn_bipartitematchings_%s.sobj'%str(names) )  
        print('...the last one was the  [',last_computed_pm,']-th entry: namely ',ConnBipartiteMatchings[-1] ) 

     
        amplitudes = 0
        
 
        for num_pm,cbpm in  enumerate(ConnBipartiteMatchings ) :
 
            cttime += 1

            GR = Graph({ }, loops=True, multiedges=True)
            GR.add_vertices(all_vertex_set)
            GR.add_edges(purecolored_edges)
            newedges0 = []
            # print('chp2')
            # print(PM_red, 'is PMred')
            for i in range(len(cbpm)) :
                ctr+=1 
                newedges0 += [[list(cbpm[i])[0],list(cbpm[i])[1], 0]]
 
                GR.add_edges(newedges0)
                  
            if GR.is_connected() : 
                
                green_edges = [e for e in GR.edge_iterator() if e[2] == 1]
                red_edges = [e for e in GR.edge_iterator() if e[2] == 2] 
                blue_edges = [e for e in GR.edge_iterator() if e[2] == 3]
                
                PM_green = PerfectMatching ( [e[0:2] for e in GR.edge_iterator() if e[2] == 1] )
                PM_red = PerfectMatching ( [e[0:2]  for e in GR.edge_iterator() if e[2] == 2] )
                PM_blue = PerfectMatching ( [e[0:2]  for e in GR.edge_iterator() if e[2] == 3] )

                coloration_dict = [{'red': red_edges, 'blue':blue_edges, 'green':green_edges,'darkgray':newedges0}]
        
                Feynman_graphs += [GR]
                coloration_bubbles += [coloration_dict]
                cbpm=PerfectMatching(cbpm)
                deg = cbpm.number_of_loops(PM_red) + cbpm.number_of_loops(PM_green) \
                                 + cbpm.number_of_loops(PM_blue)+  2*len(bubbles) - len(all_vertex_set) -3 \
                                + sum ( omega[bubbles_copy[ii]] for ii in range(len(bubbles)) )
                
                # last line are the degrees 
                newamp= N^(deg)
                amplitudes+= newamp
 
        if  cttime % 20000 == 0  :
            print('Tested bipartiteness for this number of matchings: ', len(ConnBipartiteMatchings), 'out of', lpm)
            print('Saving bipartite partitions for these vertices (reusable for colour-changed input)...')
            save( [Feynman_graphs, coloration_bubbles,ConnBipartiteMatchings, num_pm, amplitudes], 'conn_bipartitematchings_%s.sobj'%str(names))
            cttime += 1 
        save( [Feynman_graphs, coloration_bubbles,ConnBipartiteMatchings, num_pm, amplitudes], 'conn_bipartitematchings_%s.sobj'%str(names))

    else:
        BPMs = load ('BPMs_%s_selfgenerated.sobj'%str(len(all_vertex_set )) )
        
        for num_pm,bpm in enumerate(BPMs) :

            GR = Graph({ }, loops=True, multiedges=True)
            GR.add_vertices(all_vertex_set)
            GR.add_edges(purecolored_edges)
            newedges0 = []
            # print(PM_red, 'is PMred')
            for i in range(len(bpm)) :
                ctr+=1 
                # print(i,list(bpm[i]), 'len bpm is', len(bpm),type(bpm) )
                newedges0 += [[list(bpm[i])[0],list(bpm[i])[1], 0]]
                GR.add_edges(newedges0)
                  
            if GR.is_connected() :
                ConnBipartiteMatchings += [bpm] 
                # notationwise
                cbpm=bpm
                green_edges = [e for e in GR.edge_iterator() if e[2] == 1]
                red_edges = [e for e in GR.edge_iterator() if e[2] == 2] 
                blue_edges = [e for e in GR.edge_iterator() if e[2] == 3]
                PM_green = PerfectMatching ( [e[0:2] for e in GR.edge_iterator() if e[2] == 1] )
                PM_red = PerfectMatching ( [e[0:2]  for e in GR.edge_iterator() if e[2] == 2] )
                PM_blue = PerfectMatching ( [e[0:2]  for e in GR.edge_iterator() if e[2] == 3] )
                
                coloration_dict = [{'red': red_edges, 'blue':blue_edges, 'green':green_edges,'darkgray':newedges0}]
        
                Feynman_graphs += [GR]
                coloration_bubbles += [coloration_dict]
                # newamp= N^(bpm.number_of_loops(PM_red) + bpm.number_of_loops(PM_green) \
                #                  +bpm.number_of_loops(PM_blue)- 3*2*len(all_vertex_set)/4 +(4*len(bubbles)-1)  -3 )
                cbpm=PerfectMatching(cbpm)
                deg = cbpm.number_of_loops(PM_red) + cbpm.number_of_loops(PM_green) \
                                 +cbpm.number_of_loops(PM_blue)+  2*len(bubbles) - len(all_vertex_set) -3 \
                                + sum ( omega[bubbles_copy[ii]] for ii in range(len(bubbles)) )
                # this line are the Gurau degrees 
                # (Should be all, if models with nonmelonic # INTERACTION vertices are used
                # print(deg, type(deg))
                newamp= N^(deg)
                amplitudes+= newamp
            
            if  cttime % 200 == 0 :
                print('Tested bipartiteness for this number of matchings: ', len(ConnBipartiteMatchings), 'out of', len(BPMs) )
                print('Saving bipartite partitions for these vertices (reusable for colour-changed input)...')
                save( [Feynman_graphs, coloration_bubbles,ConnBipartiteMatchings, num_pm, amplitudes], 'conn_bipartitematchings_%s.sobj'%str(names))
                cttime += 1 
                print('Free energy sofar: ', amplitudes)
                
        save( [Feynman_graphs, coloration_bubbles,ConnBipartiteMatchings, num_pm, amplitudes], 'conn_bipartitematchings_%s.sobj'%str(names))

    return Feynman_graphs, coloration_bubbles, amplitudes


def FeynmanGr_degs_withoutsaving(bubbles):
    """ Connected Feynman diagrams.     As output, one has six objects. Take the corresponding entry to read what you want: 
    0: Feynman grs, 1: colorations, 2: sum of amplitudes, 3: degrees, 4: melons, 5: GRB-loops (loop per color [1,2,3])\n\n   """
    marked_bubbles = marking_coloring(bubbles)[0]
    coloration_bubbles =  [] 
    all_vertex_set = []
    purecolored_edges = []
    to=time.time()
    ctr = 0
    grbloops = []
    amplitudes = 0
    cttime = 0
    names=''
    melons = []
    last_computed_pm=0
    
    bbl_sizes = list(map(len,bubbles)) 
    
    # immutable copy of bubble:
    bubbles_copy = [ bbl.copy(immutable=True) for bbl in bubbles ]
    for bbl in marking_coloring(bubbles)[0] :
        all_vertex_set += bbl.vertices()
        purecolored_edges += bbl.edges()
    # select conn. bip. matchings...
    ConnBipartiteMatchings = []
    degs=[]
    # list of Feynman graphs :
    Feynman_graphs  = [] 
    conn_counter =0 
    # next is the double factorial (2 #V - 1)!! :
    lpm = (len(all_vertex_set)-1).multifactorial(2)
 
    for grafo in bubbles:
        names+=str(grafo.num_verts())

    BPMs = load ('BPMs_%s_selfgenerated.sobj'%str(len(all_vertex_set )) )
    
    for num_pm,bpm in enumerate(BPMs) :
 
        GR = Graph({ }, loops=True, multiedges=True)
        GR.add_vertices(all_vertex_set)
        GR.add_edges(purecolored_edges)
        newedges0 = []
        # print(PM_red, 'is PMred')
        for i in range(len(bpm)) :
            ctr+=1 
            # print(i,list(bpm[i]), 'len bpm is', len(bpm),type(bpm) )
            newedges0 += [[list(bpm[i])[0],list(bpm[i])[1], 0]]
            GR.add_edges(newedges0)
              
        if GR.is_connected() : 
            # notationwise

            cbpm=bpm
            green_edges = [e for e in GR.edge_iterator() if e[2] == 1]
            red_edges = [e for e in GR.edge_iterator() if e[2] == 2] 
            blue_edges = [e for e in GR.edge_iterator() if e[2] == 3]
            PM_green = PerfectMatching ( [e[0:2] for e in GR.edge_iterator() if e[2] == 1] )
            PM_red = PerfectMatching ( [e[0:2]  for e in GR.edge_iterator() if e[2] == 2] )
            PM_blue = PerfectMatching ( [e[0:2]  for e in GR.edge_iterator() if e[2] == 3] )
            
            coloration_dict = [{'red': red_edges, 'blue':blue_edges, 'green':green_edges,'darkgray':newedges0}]
    
            Feynman_graphs += [GR]
            coloration_bubbles += [coloration_dict] 
            cbpm=PerfectMatching(cbpm)
            rl=cbpm.number_of_loops(PM_red)
            gl= cbpm.number_of_loops(PM_green)
            bl=cbpm.number_of_loops(PM_blue)
            deg = rl+gl+bl+  2*len(bubbles) - len(all_vertex_set) -3 \
                            + sum ( omega[bubbles_copy[ii]] for ii in range(len(bubbles)) )
            # this line are the Gurau degrees 
            # (Should be all, if models with nonmelonic # INTERACTION vertices are used
            # print(deg, type(deg))
            newamp= N^(deg)
            amplitudes+= newamp
            degs +=[deg]
            grbloops +=[ [gl,rl,bl] ]
            conn_counter+=1
            if deg == 0 :
                melons += [conn_counter-1]
            
                # print('melon, deg=', deg, ' at entry num_pm=', num_pm )
    print('done, entries are: 0: Feynman grs, 1: colorations, 2: sum of amplitudes, 3: degrees, 4: melons, 5: grb loops')
    print('amplitudes:', amplitudes)
    return Feynman_graphs, coloration_bubbles, amplitudes, degs, melons, grbloops 

def show_random_FeynGraphs(LISTA,num_graphs):
    """input: list of invariants, number of random graphs"""
    intgrl = FeynmanGr_degs_withoutsaving(LISTA)
    lgt = len(intgrl[-1])
    mn= min(lgt,num_graphs)
    listofgraphs = [randint(0, lgt-1) for i in range(mn)]
    #print('Warning: You might see a graph more than twice!')
    for t in listofgraphs:
        print('Amplitude of this graph is:', N^intgrl[-3][t] )
        print('Bicoloured loops of this graph are:', intgrl[-1][t] )
        show(intgrl[0][t].plot( edge_colors= intgrl[1][t][0], \
                               figsize=1.2*len(LISTA),dpi=100,vertex_labels=False,vertex_size=30))