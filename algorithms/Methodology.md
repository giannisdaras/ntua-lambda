## Κατάταξη σε κλάσεις πολυπλοκότητας

Ορισμένα tips:

* Ξεκίνα πάντα με το να γράφεις της κλάσης πολυπλοκότητας με τη σειρά που τις ξέρεις.
* Όταν βλέπεις το $log_n a​$ πάντα θέλει αλλαγή βάσης
* Όταν βλέπεις $something^{log_n}$ τότε σκέψου το $n^{log_n}$, κατά πάσα περίπτωση είναι σε αυτή την κλάση πολυπλοκότητας (είτε είναι σταθερό, είτε είναι n είτε είναι logn.
* Όταν βλέπεις να υψώνονται σε περιέργες δυνάμεις, καλό είναι να τα φέρνεις όλα στην ίδια βάση με το κολπάκι.


$$
log(n!) = \Theta(nlogn)
$$


Stirling:
$$
n! \approx \sqrt{2\pi n} \big( \frac{n}{e}\big)^n
$$

$$
\sum_{k=1}^{n} k^d =  \Theta(n^{d+1})
$$

### Master theorem

Θέλουμε dominance του ενός ή του άλλου όρου με πάνω απο ένα log διαφορά. Αλλιώς, η πολυπλοκότητα είναι $n^{crit}log^{k+1}n​$.

Όταν βλέπεις $n^k​$ να θέτεις $n =  2^m​$ ώστε να πάνε όλα στον εκθέτη και μετά να βρεις την πολυπλοκότητα μιας $S(m)​$ την οποία θα γυρίσεις πάλι πίσω σε $T(m)​$.



## Δομές δεδομένων

### Ουρές προτεραιότητας

Ορίζουν μια διάταξη των στοιχείων που είναι μέσα στη δομή.

Μια ουρά προτεραιότητας υλοποιείται με σωρό.



### Segment trees

Ιδιαίτερα χρήσιμη δομή όταν θες να δουλέψεις με ranges πάνω σε ένα array και να κάνεις πράγματα του τύπου: min queries in a range, sum in a range, diff in a range, etc.







## Αλγόριθμοι ταξινόμησης

### Heapsort

Φτιάξε έναν σωρό σε $\Theta(n)$ και μετά κάνε n φορές extract min.

### Quickselect

Μοιάζει με την quicksort. Απαντά σε ερωτήματα του τύπου το "k-οστό" μικρότερο στοιχείο.

Ο τρόπος να υλοποιηθεί είναι η quicksort αλλά κάθε φορά δουλεύω μόνο με το ένα μισό του πίνακα.

Η QuickSelect έχει O(n) **μέσο** χρόνο απόκρισης και οδηγεί σε μία **μερική ταξινόμηση** του πίνακα, την οποία μπορούμε να εκμεταλλευτούμε σε διάφορες εφαρμογές.





### Quicksort

Ξεκινάει με ένα τυχαίο στοιχείο.

Για αυτό το στοιχείο, βάζει γραμμικά όσα είναι μεγαλύτερα του δεξιά του όσα ειναι μικρότερα του αριστερά του. Άρα, αυτό το στοιχείο βρήκε την θέση του! Επίσης, ο αριστερός και ο δεξιός υποπίνακας είναι πλέον άσχετοι μεταξύ τους και μπορώ να δουλέψω με τον καθένα ξεχωριστά.
$$
Τ(n) = \Theta(n) + max(T(k) + T(n-k))
$$


### Κόλπα

Πολύ συχνά σε ασκήσεις έχεις ίδιες τιμές. Σε αυτή την περίπτωση, είναι χρήσιμο να χρησιμοποιήσεις buckets.



## Αλγόριθμοι αναζήτησης

### Binary search

It can be used to solve various problems.

- Find element in a sorted array.
- Find first occurrence of an event in a discrete/continuous search space.
  - We return low or high which represents the minimum (first event occurrence).
  - The return condition is `low >= high`.
  - For continuous problems, the return condition is `low >= high + epsilon`.

### Interpolation search

Διαλέγει με πιο έξυπνο τρόπο το "mid", αξιοποιώντας πληροφορίες σχετικές με την κατανομή των στοιχείων. Συγκεκριμένα, συγκρίνει την αξία του στοιχείου που ψάχνουμε με το low και από τη διαφορά τους αλλά και το μέσο ρυθμό αύξησης καταλαβαίνει πόσες θέσεις πρέπει να μετακινηθεί από το low.



## Άπληστοι αλγόριθμοι

Πρέπει να υπάρχουν οι εξής δύο ιδιότητες:

* Αρχή βελτιστότητας

  Αυτό σημαίνει ότι η λύσεις που δίνει η βέλτιστη λύση είναι βέλτιστες και για τα υποπροβλήματα της. Πχ αν υπολογίζει ελάχιστο μονοπάτι s-u το οποίο περνάει από το s-t, τότε και το s-t είναι όντως το συντομότερο.

* Άπληστη επιλογή

  Η βέλτιστη λύση θα συμφωνεί με την επιλογή που κάνει ο άπληστος αλγόριθμος μας.



## Αλγόριθμοι γράφων



### Αναπαραστάσεις γράφων

Η λίστα γειτνίασης είναι συνήθως πιο συμφέρουσα αναπαράσταση, καθώς οι περισσότεροι αλγόριθμοι δουλέουν με τους γείτονες μιας κορυφής.

Ο πίνακας γειτνίασης μπορεί να είναι χρήσιμος για την εύρεση σχημάτων μέσα στο γράφο, όπως τρίγωνα με πολλαπλασιασμό με τον εαυτό του.



#### DFS, BFS

Η DFS γίνεται αναδρομικά. Η BFS γίνεται με FIFO.

#### Topological sorting

Είναι μια DFS με ένα stack.

#### Connected components

Kosaraju's algorithm. Τρέξε DFS στον κανονικό και μετά DFS στον transpose.



### Συνδετικά δέντρα

#### Kruskal algorithm

Ταξινομεί τις ακμές και κάνει find, union.

Τα union, find μπορούν να γίνουν σε O(α(V)) χρόνο άμα χρησιμοποιήσουμε path compression και union by rank.

Η ταξινόμηση των ακμών θέλει $O(ElogE)$. 

Άρα, η συνολική πολυπλοκότητα του αλγορίθμου είναι: $O(ElogE)$.

### Prim algorithm

Ο Prim διατηρεί ένα Tree και προσθέτει κάθε φορά την φθινότερη ακμή για να διευρύνει αυτό το Tree.

Η πολυπλοκότητα του είναι: $Ο(E + VlogV)$ αν χρησιμοποιηθεί Fibonacci heap (ίδια με του Dijkstra).



### Boruvka's algorithm

Δουλέυει με το να διατηρεί ένα forest από connected components και σιγά σιγά να τα ενώνει όλο και περισσότερο. Συγκεκριμένα, σε κάθε επανάληψη, βρίσκει την μικρότερη ακμή που βγαίνει από κάθε connected component και κάνει αυτή τη σύνδεση.

Τα components που φτιάχνει είναι το πολύ logV. Σε κάθε iteration εξετάζει τις εναπομείνουσες ακμές, οπότε παίρνει $O(ElogV)$.



### Αλγόριθμοι ελαχίστων μονοπατιών

#### Dijkstra algorithm

$$
O(E + VlogV) = O(E T_{dk} + VT_{em})
$$

Κάθε φορά στο priority queue υπάρχουν οι κορυφές που απέχουν μια ακμή από τις προηγούμενες finished.

Έστω ότι έχουμε δύο κριτήρια. Μπορεί να χρειαστεί να τρέξουμε Dijkstra κάνοντας optimize το πρώτο αλλά χωρίς να κάνουμε overkill το δεύτερο.  Αυτό γίνεται τρέχοντας Dijkstra σε έναν μεγαλύτερο γράφο όπου οι κορυφές αναπαριστούν τις διαφορετικές τιμές του 2ου κριτηρίου.



#### Bellman ford algorithm

$$
O(V\cdot E)
$$

Τρέχει για όλες τις κορυφές updates όλων των ακμών.

Αν στην τελευταία κορυφή γίνει update, τότε υπάρχει κύκλος αρνητικού μήκους.

Είναι χρήσιμος αλγόριθμος στην DP μορφή του για να λύνεις προβλήματα που περιορίζουν τον αριθμό των χρησιμοποιούμενων ακμών.



### Floyd-Warshall algorithm

$$
DP[i][j][k] = min\big( DP[i][j][k-1], \quad DP[i][k][k-1] + DP[k][j][k-1] \big)
$$

Complexity: 
$$
O(V^3)
$$

### Johnson's algorithm

Βάζει μια κορυφή q. Κάνει bellman ford. Μετασχηματίζει τα βάρη σε θετικά. Τρέχει Dijkstra V φορές.

Η ορθότητα του αλγορίθμου βασίζεται στα negative cycles.



## Αλγόριθμοι ροής



**Πρόταση 1: ** Το max flow φράσσεται από το capacity οποιασδήποτε τομής.

**Max flow, min cut **: Το max flow είναι ίσο με το min capacity, δηλαδή το capacity που έχει η min cut.

Residual graph: η μπροστά ακμή δείχνει το πόσο μένει, η πίσω το πόσο έχει ήδη συμπληρωθεί.

Πώς τρέχει; Φτιάχνει κάθε φορά τον residual graph για αυτή τη ροή και ψάχνει να βρει ένα μονοπάτι που έχει χωρητικότητα ακόμα. Αν το βρει, το φουλάρει.

Παρατηρήσεις πολυπλοκότητας:

* Αν έχεις ακέραιες χωρητικότητες τότε ο Fold-fulkerson με DFS τρέχει σε $O(mU)$. Η ιδέα είναι ότι θες $O(V+E)$ για να βρεις το augmenting path και κάθε φορά το ανεβάζεις κατά 1 μονάδα. 
* Για άρρητες χωρητικότητες μπορεί να μην τερματίσει
* Edmonds-Karp: κάνει BFS αντί για DFS και τερματίζει σε $O(nm^2)$



## Αλγόριθμοι συντομότερων μονοπατιών



### Συντομότερα μονοπάτια σε DAG

$$
O(V+E)
$$
Ο λόγος είναι ότι το DAG γράφημα σου λέει με ποιά σειρά να κάνεις τα updates (σε όλους τους αλγορίθμους). Ο ίδιος αλγόριθμος χρησιμοποιείται για να βρει και τα μεγαλύτερα μονοπάτια σε ένα DAG.



## Dynamic Programming

Θα αναλύσουμε σημαντικά προβλήματα DP που τα ζητάει συνέχεια.

Τρόπος να τα σκέφτεσαι:

* Το τι θες να πετύχεις είναι αυτό που θες να αποθηκεύσεις μέσα στο DP
* Το τι θα κρατήσεις μέσα στον πίνακα DP είναι το τι χαρακτηρίζει μοναδικά ένα υποπρόβλημα.
* Ο DP πρέπει να εκφράζει όλες τις δυνατές επιλογές που έχεις για το εκάστοτε στοιχείο i που εξετάζεις.

Κόλπο: Αν έχεις ένα σύνολο από στοιχεία, τότε μπορείς να κωδικοποιήσεις τα στοιχεία με αριθμούς που αντιστοιχούν στη θέση του στο σύνολο.



### Subset sum

Το objective είναι αν μπορεί να γίνει ή όχι. Άρα, αυτό που βάζεις μέσα στο DP είναι 0 ή 1. 

Για να απαντήσεις για αυτό το στιγμιότυπο, πρέπει να ξέρεις αν το προήγουμενο στιγμιότυπο μπορεί να πετύχει το b ή το b - αυτό που έχω εγώ να του δώσω.
$$
DP[i][b] = DP[i-1][b] \vee DP[i-1][b-s_i]
$$


### 0-1 Knapsack problem

Τι θες να βρει το DP; Την μέγιστη αξία που μπορείς να πετύχεις. Άρα, αυτό είναι που μπαίνει στα κελιά του πίνακα.

Τι χαρακτηρίζει μοναδικά ένα υποπρόβλημα;

* Το capacity που έχει
* Το αντικείμενο που εξετάζεις κάθε φορά.


$$
DP[i][b] = min\big( DP[i-1][b], DP[i-1][b-b_i] + v_i \big)
$$

### Equal sums

$$
DP[i][k] = DP[i-1][k] \vee DP[i-1][k-v_i] \vee DP[i-1][k+v_i]
$$



### Coin problem

Έχεις διάφορα νομίσματα.

Σε ενδιαφέρει να βρεις πώς μπορείς να σχηματίσεις ένα πόσο με τον ελάχιστο αριθμό κερμάτων.

Αφού σε ενδιαφέρει ο ελάχιστος αριθμός κερμάτων, αυτό που αποθηκεύεις μέσα στο DP είναι ο αριθμός των κερμάτων που έχεις χρησιμοποιήσει.



### Convex hull trick

Ένα ωραίο κολπάκι για DP optimizations.

Δουλέυει σε προβλήματα όπου η αναδρομή του DP[i] εξαρτάται γραμμικά από μία f(i - k) με k>0 θεωρώντας ως σταθερές τα διάφορα g(j) που μπορεί να εμφανίζονται.

Αυτό που μπορείς να κάνεις τότε είναι να φτιάξεις ένα convex hull με ευθείες στο οποίο να το ρωτάς για το καλύτερο j και να προσθέτεις ευθείες όσο περνάνε τα i.

Η δομή convex hull περιέχει lines και σημεία μέχρι τα οποία κυριαρχούν. Συνεπώς, μπορούμε να βρούμε εύκολα κάθε φορά ποιό line κυριαρχεί με δυαδική αναζήτηση. Όταν μπαίνει ένα καινούργιο line, φτιάχνουμε από το τέλος προς την αρχή το convex hull κοιτώντας τα intersection points και αδειάζοντας το κατάλληλα. 





## Αναγωγές

### Hamiltonian Path σε Longest Path ακμών

Είναι και τα δύο paths, οπότε ένα longest path $V-1$ ακμών είναι το Hamiltonian Path. Επειδή δεν μπορούμε να βρούμε μεγαλύτερο path από αυτό, αυτή είναι η λύση.

### Subset Sum σε Knapsack

Άμεση απόδειξη.



## Complexity classes

### NP class

NP is a class for decision problems. Problems that their solution is verifiable in linear time belong to this class.

### NP-hard

If a problem is NP-hard is at least as difficult as any problem in the NP class. An NP-hard problem is not sure that it belongs to NP class, which means that its' solution may not even been verified in linear time. What is true is that if you solve an NP-hard problem you can solve any problem that is NP.

### NP-Complete

The hardest problems that belong to NP class.

### Known problems and their class

1. Traveling Salesman Problem (TSP)

   Visit all cities and return to the initial city without using a road twice. Do that with the minimum cost.

   Class: **NP HARD**

2. Longest path problem

   Class: **NP HARD**

3. Hamiltonian Path / Hamiltonian Cycle

   Visit all cities but pass from each city exactly one time (that basically means passing from each road exactly one time too).

   Class: **NP COMPLETE**

4. SAT PROBLEM

   Σου δίνουν μια λογική έκφραση από τομές ενώσεων και θες να δεις αν υπάρχουν τιμές των μεταβλητών της ώστε να γίνεται evaluate σε true.

   Class: **NP COMPLETE**

5. Integer programming
   $$
   max(c^T x) \textrm{ given that } Ax\leq b, x\geq 0
   $$
   Class: **NP COMPLETE**

6. Set cover problem
   $$
   F=\{S_1, S_2, S_3, ..., S_n\}
   $$

   $$
   U = S_1 \vee S_2 ... \vee S_n
   $$

   **Pick** the smallest number of $S_i$ so you can construct $U$.

7. Set splitting
   $$
   F = \{ S_1, S_2, ..., S_n \}
   $$

   $$
   U = S_1 \vee S_2 ... \vee S_n
   $$

   Partition $U$ into $U_1, U_2$ so there is no $S_i$ completely in $U_1$ or completely in $U_2$

8. Steiner tree

   Given a subset of vertices V in a graph find the tree of minimum weight that contains them (but may contain other vertices of V too).

9. Subset sum problem

   Έχεις ένα σύνολο από στοιχεία και θες να βρεις ένα subset που αθροίζει ακριβώς σε έναν αριθμό.

   

   



