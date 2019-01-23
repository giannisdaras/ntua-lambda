### Ορισμοί και προδιαγραφές

Λογισμικό: προγράμματα + δεδομένα + τεκμηρίωση

Πηγαίος κώδικας, προδιαγραφές/εκθέσεις/αναφορές, σχέδια, διαγράμματα, 

Στο λογισμικό θέλουμε: ορθότητα, χρονική συνέπεια, τεκμηρίωση, ποιότητα, λογική τιμή



Project planning:

- project split
- cost estimation
- milestones

**W**ork **B**reakdown **S**tructure (Ιεραρχική κατανομή εργασιών) (WBS)



### Critical path

Η ακολουθία των ενεργειών που θα αποτύχουν αν αποτύχει το έργο.



### Χαλαρό περιθώριο (stack, float)

Το χρονικό διάστημα που μπορεί να καθυστερήσει μια εργασία χωρίς να καθυστερήσει κάποια επόμενη της ή το έργο συνολικά.



### Gant charts

every task from WCB has some that it depends on and three times associated with it: optimistic, normal, pessimistic.



## Υλοποίηση ενός project



### Οπτικές project

Αρχικά, πρέπει να δούμε τις διαφορετικές οπτικές του project:

- Λογικό επίπεδο (logical view). 

  Αφορά το functionality που προσφέρει η εφαρμογή στους end users. 

  Περιγράφεται συνήθως με UML:

  - Διαγράμματα κλάσεων/οντοτήτων. 
  - Διαγράμματα μεταβάσεων

- Φυσικό επίπεδο (physical view).

  Αφορά την τοπολογία ενός συστήματος και τον τρόπο με τον οποίο συνδέεται σε φυσικό επίπεδο.

  Περιγράφεται συνήθως με UML:

  * Διαγράμματα deployment

- Development view.

  Software management. 

  Συνήθως περιγράφεται με:

  * Component diagram. (Είναι αυτό το πράγμα με τα blocks, περιγράφεται αναλυτικά)

- Process view.

  Ασχολείται με το scalability της εφαρμογής, την runtime συμπεριφορά της, τον τρόπο με τον οποίο επικοινωνούν οι διεργασίες της εφαρμογής, το distribution, κ.α.

  Περιγράφεται με:

  * Activity diagram.

- Scenarios - Use case view



### Κύκλος ζωής project

- Καταγραφή και ανάλυση απαιτήσεων
- Σχεδιασμός
- Υλοποίηση
- Επαλήθευση και επικύρωση
- Εγκατάσταση, έλεγχος, παραμετροποίηση και ολοκλήρωση στο παραγωγικό του περιβάλλον
- Συντήρηση και επέκταση



Ο κύκλος ζωής ενός project καθορίζεται από κάποιο **μοντέλο λογισμικού**.

#### Μοντέλα λογισμικού

Μοντέλα στοιχείων λογισμικού:

- Αφαιρετικά
- Συμπληρωματικά
- Υλοποιήσιμα

Μορφές μοντέλων:

- Δομημένο κείμενο (πρότυπα - standards)
- Διαγράμματα 
- Ψευδοκώδικας, κ.α.

Ορίζουν το πως θα πρέπει να δομηθεί, να σχεδιαστεί και να υλοποιηθεί ο κύκλος ζωής λογισμικού.

- Sequential (ακολουθιακά)

- Waterfall (μοντέλο καταρράκτη)

  

  ![](https://i2.wp.com/s3.amazonaws.com/production-wordpress-assets/blog/wp-content/uploads/2016/12/08151155/waterfall-model.png?fit=604%2C270&ssl=1)

  

  Διακριτές φάσεις:

  - Προδιαγραφή (Απαιτήσεις από το σύστημα και επικύρωση)
  - Ανάπτυξη:
    - Ανάλυση (Απαιτήσεις από το λογισμικό και επικύρωση)
    - Σχεδίαση:
      - Προκαταρκτική σχεδίαση και επαλήθευση
      - Λεπτομερής σχεδίαση και επαλήθευση
    - Κωδικοποίηση:
      - Κωδικοποίηση και έλεγχος μονάδων
      - Συνένωση και επαλήθευση
  - Επαλήθευση (προλειτουργία έλεγχος και έλεγχος)
  - Εξέλιξη (Λειτουργία Συντήση και Επανεπικύρωση)

- Incremental (αυξητικό - μοντέλο λειτουργικής επαύξησης)

  Χωρίζουμε το μοντέλο καταρράκτη σε διάφορα τμήματα (τα οποία μπορεί να έχουν και χρονικές σχέσεις) και προχωράμε για το κάθε τμήμα. Συνενώνουμε στο τέλος.

  Κάνουμε waterfall στα επιμέρους τμήματα.

  

  ![](https://www.guru99.com/images/6-2015/052615_1049_WhatisIncre2.png)

  

- Spiral model (σπειροειδές μοντέλο)

  ![](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Spiral_model_%28Boehm%2C_1988%29.svg/1200px-Spiral_model_%28Boehm%2C_1988%29.svg.png)

  Κάθε κύκλος του spiral είναι μια Φάση ανάπτυξης.

  Στον ορίζοντιο άξονα κάθε κύκλου βλέπουμε το progress ως τώρα και στον κατακόρυφο το κόστος ως τώρα.

  Κάθε Φάση στο spiral μοντέλο χωρίζεται στα εξής τμήματα:

  - Να βρούμε τι θέλουμε να κανουμε και πώς θα το κάνουμε έξυπνα
  - Να βρούμε τα ρίσκα και να τα λύσουμε
  - Να κάνουμε την κωδικοποίηση (ανάπτυξη)
  - Να κάνουμε μια σούμα του τι πετύχαμε και να ξεκινήσουμε τον σχεδιασμό της επόμενης φάσης

- Μοντέλο πίδακα (Fountain model)

  

  ![](https://image.slidesharecdn.com/fountainmodel-130417035342-phpapp02/95/fountain-model-3-1024.jpg?cb=1366171030)

  A logical improvement to waterfall  model.

- Γενικό μοντέλο ανάπτυξης:

  Ανάπτυξη σε κύκλους σύμφωνα με τα χαρακτηριστικά και τις δυνατότητες του κατασκευαστή. Μια γενικευμένη μορφή των μοντέλων που αναφέρθηκαν.

- Agile (ευέλικτο)

Μεθοδολογίες ανάπτυξης:

- Rapid prototyping

  Κατασκευάζονται διαδοχικά πρωτότυπα με ολοένα και περισσότερα χαρακτηριστικά. Ελέγχονται ένα ένα (ανάλυση + σχεδίαση + κωδικοποίηση + έλεγχος) και μετά δοκιμάζονται μέχρι να φτάσουμε σε ένα πλήρως αποδεκτό σύστημα.

- Extreme programming

- Test-driven development

- Continuous delivery



Μια γενική μεθολογία ανάπτυξης λογισμικού είναι η RUP. Η ανάλυση της ακολουθεί:



##### Rational Unified Process

- Επαναληπτική (iterative) μεθοδολογία
- Ολοκληρωμένη διαδικασία ανάπτυξης λογισμικού από την Rational Corporation (IBM bought this)
- Από μικρά εώς μεγάλα έργα λογισμικού
- UML ως γλώσσα μοντελοποίησης

Χωρίζεται σε 4 φάσεις:

- inception (σύλληψη ιδέας)

  - Ανάγκες εμπλεκόμενων μερών (stakeholders)
  - Καθορισμός κριτηρίων αποδοχής, εμβέλειας, κλπ
  - καθορισμός του business case (στρατηγική διαχείρισης ρίσκου, αρχικό πλάνο έργου)
  - καθορισμός υποψήφιας αρχιτεκτονικής
  - αξιολόγηση/εκτίμηση ρίσκου
  - εκτίμηση πόρων που χρειάζονται για την επόμενη φάση

  Για να είναι εφικτή συνήθως πρέπει να έχουμε:

  - Ένα mockup prototype
  - Μια ανάγκη που πρέπει να εξυπηρετηθεί
  - Κάποιους πόρους
  - Ένα όραμα

- elaboration (επεξεργασία)

  - Καθορισμός κινδύνων
  - ευσταθές όραμα για το προϊόν
  - καθορισμός αρχιτεκτονικής
  - προγραμματισμός πόρων/κόστους
  - architecture baseline (?)
  - tooling
  - Καθορισμός περιβάλλοντος ανάπτυξης
  - Το πλάνο ελέγχου

  Για να γίνει πρέπει να έχουμε:

  - Τα αποτελέσματα της προήγουμενης φάσης
  - Ένα εγκεκριμένο πλάνο και προϋπολογισμό έργου
  - Τους απαιτούμενους πόρους

- construction (κατασκευή)

  - Διαχείριση των πόρων για την εκτέλεση του έργου ανάπτυξης
  - Ανάπτυξη σε επαναλήψεις
  - Ανάπτυξη components ώστε να ικανοποιούν τα σενάρια χρήσης
  - έλεγχος μονάδων και integration
  - Αξιολόγηση κύκλου επανάληψης

  Πρέπει να έχουμε διαθέσιμα:

  - Τα προήγουμενα αποτελέσματα
  - Το πλάνο της τρέχουσας επανάληψης
  - Εκτίμηση ρίσκου για την τρέχουσα επανάληψη
  - Προβλήματα που πρόκειται να αντιμετωπίσουμε

- transitition (μετάβαση)

  Τι είναι:

  - Διάθεση του λογισμικού στους χρήστες
  - Marketing, διανομή, εγκατάσταση, εκμάθηση χρηστών, υποστήριξη, επιδιορθώσεις

  Πρέπει να έχουμε διαθέσιμα:

  - Τα προϊόντα της φάσης κατασκευής σε ώριμη φάση

  ΤΙ κάνουμε:

  - Έλεγχο του προϊόντος στον πελάτη
  - Fine tuning
  - Διάθεση στον πελάτη για παραγωγική χρήση
  - Υλικό υποστήριξης

  Με την ολοκλήρωση του:

  - Επικαιροποιημένο documentation
  - Νέες δυνατότητες του κατασκευαστή

Rup principles:

- Business modeling
- Requirements
- Analysis and desing
- Implementation
- Testing 
- Deployment





Ένα άλλο μοντέλο ανάπτυξης λογισμικού είναι το Agile.

Η ανάλυση του ακολουθεί:



##### Agile

> Agile software development is an umbrella for a set of methods and practices based on the values and principles expresses in Agile Manifesto.

Solutions through collaboration of self-organizing, cross-functional teams untilizing the appropriate practices for their context.



Agile manifesto principles:

1. Satisfy customer through early and continuous delivery of valuable software
2. **Welcoming changing** requirements, even late in development.
3. **Deliver** working software frequently
4. **Business and developers should work together**
5. Build projects around motivated individuals. Give them the environment, the support and the trust they need.
6. **Face-to-face** conversation to convey information through and within the team
7. Working software is the primary **measure of progress**
8. **Sustainable development**
9. Continuous attention to technical excellence and good design **enhances**
10. **Simplicity**
11. The best architectures and designs emerge from **self-organizing teams**
12. At regular intervals the team **reflects** on how to become more effective, tunes and adjusts behavior accordingly.

Scrum, XP, RUP, Kanab , Do Whatever fall into Agile methodology.

Characteristics:

- Active stakeholders participation
- Test driven design
- Iteration modelling
- Executable specifications
- look ahead modeling

###### Scrum

Scrum values:

- Courage

  Have the courage to do the right thing and work on hard problems

- Focus

  Everyone focuses on the Scrum sprint and the goals of the Scrum Tream

- Commitment

  People personally commit to achieving the goals of the Scrum Team

- Respect

  Scrum people respect each other to be capable, independent people

- Openness

  The Scrum Team and the stakeholders agree to be open about all the work and the challenges with performing the work

Each sprint has it's own backlog.

- Forecast
- Todo
- In progress
- Done

Steps:

- Sprint: a time-box during which a useable, potentially releasable product increment is created. Sprints have consistent durations in a project.
- Sprint planning: from the whole team collaboratively.

- Daily Scrum: a 15-minute time-boxed event to sync and create a plan for the next 24 hours
- Sprint review: at the end of the sprint to inspect the Increment and adapt the Product Backlog if needed
- Sprint retrospective: occurs after the Sprint Review and prior to the next Sprint Planning. The Scrum Team inspects itself





Τα μοντέλα λογισμικού που αναφέραμε μας καθοδηγούν στο πως να διανείμουμε το χρόνο ανάμεσα σε κάθε στάδιο ανάπτυξης αλλά και πως να συνδέσουμε τα διαφορετικά στάδια μεταξύ τους. Τώρα μελετάμε χωριστά για κάθε στάδιο τι είναι απαραίτητο να γίνει.



#### Στάδιο ανάλυσης

Χρειαζόμαστε τα έγγραφα που ακολουθούν.

##### SRS

Έγγραφο απαιτήσεων λογισμικού.

- Λειτουργικές απαιτήσεις
- Μη λειτουργικές απαιτήσεις

Μελέτη προβλήματος <-> Ανάλυση απαιτήσεων <-> Προδιαγραφή απαιτήσεων

- Μέρος 1: Εισαγωγή και ταυτοποίηση εγγράφου

  - Ταυτότητα εγγράφου
    - Χαρακτηρισμός του εγγράφου στο έργο.
  - Σκοπός 
    - Σκοπός στο έργο
    - Σε ποιόν απευθύνεται
    - Τι θέλει να του μεταδώσει
    - Πώς εντάσσεται στο έργο
  - Εμβέλεια
    - Τι θα καλύψει και τι όχι
  - Ορισμοί, ακρωνύμια, συντομογραφίες
  - Πηγές αναφορών
  - Περίληψη

- Μέρος 2: Γενική περιγραφή του λογισμικού

  - Στίγμα
  - Προοπτική
  - Γενικές λειτουργίες του λογισμικού
  - Χαρακτηριστικά χρηστών
  - Περιορισμοί
  - Παραδοχές και εξαρτήσεις

- Μέρος 3: Ειδικές απαιτήσεις

  - Απαιτήσεις εξωτερικών διεπαφών
    - Διεπαφές χρήστη
    - Διεπαφές υλικού
    - Διεπαφές λογισμικού
    - Διεπαφές επικοινωνιών

  - Λειτουργικές απαιτήσεις

    Τι κάνει το λογισμικό, με ποιά είσοδο, πως πρέπει να την επεξεργαστεί και ποιά έξοδο.

    Για κάθε λειτουργία ΞΕΧΩΡΙΣΤΑ.

  - Απαιτήσεις επιδόσεων

  - Περιορισμοί σχεδίασης

    - Υλικού
    - Συμφιλίωση με πρότυπα

  - Χαρακτηριστικά λογισμικού:

    - Αξιοπιστία
    - Διαθεσιμότητα
    - Ασφάλεια
    - Μεταφερσιμότητα





#### Διαγράμματα ροής δεδομένων

- Μετασχηματισμένο Δεδομένο (Κύκλος)
- Ροή δεδομένων με βέλη
- Πηγή πληροφορίας ή έξοδος πληροφορορίας τετράγωνο

Δίκτυο από δεδομένα που ρέουν και μετασχηματίζονται σε νέα δεδομένα από μετασχηματισμούς.

Δεν αναπαρίσταται η πληροφορία χρονισμού.

Πρέπει να υπάρχει ισορροπία μεταξύ της ουσιώδους και της κατασκευαστικής λεπτομέρειας.



#### Εννοιολογικά μοντέλα δεδομένων (ERD)

Οντότητες και συσχετίσεις μεταξύ των οντοτήτων.

Οι οντότητες έχουν ορισμένα πεδία.



#### Διάγραμμα μετάβασης καταστάσεων

Σαν DFA.

Συμβολισμοί:

- Κατάσταση έναρξης τελεία
- Κατάσταση τέλους διπλή τελεία
- Κατάσταση τετράγωνο
- Τα βέλη δείχνουν γεγονός/απόκριση

#### Λεξικό δεδομένων

Μια πλήρη χαρτογράφηση (Πίνακας ή ΒΔ) των δεδομένων της εφαρμογής.

Έχει για κάθε τύπο δεδομένων:

- Ονομασία
- Βοηθητικές ονομασίες
- Πού χρησιμοποιείται
- Πώς χρησιμοποιείται (στοιχείο εισόδου, πεδίο, κ.α. )
- Τι περιέχει
- Όρια τιμών
- Αρχική τιμή
- Λοιπά στοιχεία



#### Στάδιο σχεδίασης

Πρότυπα σχεδίασης:

- Creational patterns (κατασκευαστικά πρότυπα σχεδίασης)

  Τα κατασκευαστικά πρότυπα σχεδίασης αφορούν το πως σχεδιάζουμε τους κατασκευαστές αντικειμένων.

  - Singleton: μια κλάση να έχει αποκλειστικά ένα στιγμιότυπο. Πχ θέλουμε ένας πόρος του συστήματος να αρχικοποιείται μια φορά. Έχει private constructor.

  - Factory method pattern: Φτιάξε μια μέθοδο που παίρνει ως input ένα String και σου επιστρέφει ένα αντικείμενο που ανήκει σε ένα σύνολο από κλάσεις που κληρονομούν από μια βασική κλάση ανάλογα με το String. Πότε το χρειάζεσαι; Όταν στο runtime θές πολύ συχνά να δημιουργείς αντικείμενα μιας βασικής κλάσης αλλά δεν ξέρεις από πριν ποιάς υποκλάσης αντικείμενα θες να δημιουργήσεις.

  - Builder pattern

    Creating different objects of the same class.

    Create a seperate Builder class.

    The base class gives the responsibility of the object creation to the Builder class. 

    BuilderClass can be overwritten, so new objects can be created.

  - Prototype pattern

    Η βασική ιδέα είναι ότι κάνεις cast των αντικειμένων στο Runtime. Η BaseClass έχει μια clone μέθοδο και όλες οι υποκλάσεις κάνουν overwrite την μέθοδο αυτή ώστε να εκτελεί το:

    `SubClass a = (SubClass) super.clone()`

    Αυτό λύνει το πρόβλημα ότι οριζόντια οι κλάσεις δεν έχουν σχέση μεταφέροντας το clone κατακόρυφα.

  - Object pool: να cachaρει αντικείμενα τα οποία είναι ακριβά να κατασκευαστούν

- Structural patterns

  Τα δομικά κατασκευαστικά πρότυπα δίνουν λύσεις στις σχέσεις που μπορούν να έχουν τα διάφορα obejcts.

  * Adapter (Wrapper). Παρέχει τη διεπαφή που περιμένει ο χρήστης χρησιμοποιώντας υπάρχουσες κλάσεις ως εργαλεία

  * Decorators. Προσθέτουμε επαυξημένη λειτουργικότητα σε ήδη υπάρχουσες υλοποιήσεις

  * Proxies. A proxy is in an intermediate class/layer which can forward our functionality to the real class or add additional logic, before/after the forwarding.

  * Composite pattern:

    Αντικείμενα που έχουν την ίδια διεπαφή μπορούν να γίνουν composed σε πιο μεγάλα αντικείμενα που με κάποιο τρόπο επιτελούν τις λειτουργίες των αντικειμένων που περιέχουν.

  * Facade

    Provide a simple interface to a complex system.

  * 

- Behavioral patterns

![Screenshot from 2019-01-23 01-50-58](/home/giannis/Pictures/sxediasi.png)

Τεχνοτροπίες:

* Διαδικαστικός προγραμματισμός
  * Βασισμένος στις διαδικασίες
  * Βασισμένος στα δεδομένα
* Αντικειμενοστραφής προγραμματισμός

Η σχεδίαση ως μεθοδολογία περιλαμβάνει:

* Αρχιτεκτονική σχεδίαση

  * Διάγραμμα δομής
  * Διάγραμμα διάταξης

* Σχεδίαση διεπαφών

  Περιγράφει πώς οι μονάδες του λογισμικού μιλάνε με το χρήστη, με το hardware μεταξύ τους και με άλλα συστήματα.

  * Τύπους παραμέτρων
  * Φύση επικοινωνίας
  * Λεπτομέρειες επικοινωνίας
  * Επικοινωνία με χρήστη

* Λεπτομερής σχεδίαση μονάδων

  * Ψευδοκώδικας

    $$x :=  value$$

    $$/* comment */$$

    FOR var FROM val1 TO val2 STEP val3 DO ...  END\_FOR​

* Σχεδίαση δεδομένων

  Στόχος είναι να παράξουμε το σχεσιακό μοντέλο. Για να γίνει αυτό πρέπει να:

  * επαληθεύσουμε το μοντέλο οντοτήτων - συσχετίσεων
  * Βελτιστοποιήσουμε/Κανονικοποιήσουμε το σχήμα δεδομένων
  * Καθορισμός τύπων και πεδίων κάθε πίνακα (φυσικό επίπεδο)
  * Καθορισμός δεικτών και όψεων (λογικό επίπεδο)



### Distributed systems

* **Data consistency**. Read corresponds to the most recent write.

  But there are more strict definitions:

  * Atomic

    Succeeds or fails.

  * Consistent

    Always in valid state.

  * Isolated

    All transactions are isolated.

  * Durable

    Changes are staying forever

  Υπάρχουν και πιο χαλαρές μορφές βέβαια:

  * Eventual consistency (BASE SYSTEMS)

    Όταν πάψουν όλες οι ενημερώσεις τότε consistency.

    Replica convergence. Σύγκλιση αντιγράφων.

* **Availability**

  High availability requires duplicates

* **Network partition**

  Network failure may lead to a partition of system to unconnected components

* **Latency**

* **Throughput**





#### CAP theorem

Αν το δίκτυο αστοχήσει, θα έχουμε είτε συνέπεια των δεδομένων είτε διαθεσιμότητα της εφαρμογής αλλά όχι τα δύο.

#### PALLEC

Αν το δίκτυο αστοχήσει ή θα έχουμε αυξημένο lattency είτε ασυνέπεια δεδομένων.

Κατηγοριοποίηση κατενημημένων συστημάτων: P<Something>/E<SomethingElse>



#### System scalability

Linear function between performance increase and resources increase.



#### Ways to increase scalability

* Οριζόντια / Scale out/in: Περισσότεροι υπολογιστές
* Κατακόρυφη / Scale up/down: Καλύτεροι υπολογιστές



#### Architecture patterns between systems that need to communicate

* Client-Server

* Peer to Peer (File sharing networks, Blockchain, Cryptocurrencies)

* Component-based (React). 

  A component implements an interface.

  An app is build by connecting together functional components.

  Application server: software which hosts components

  Loose coupling and seperation of concerns

* Πάντα ξεκινάμε σχεδίαση από interfaces

* Layered/N-tier architecture

  Linux TTY layer

* Model View Controller

  Model: data

  View: presentation of data

  Controller: handles user requests, gets appropriate data, processes them and forwards them to view

* Model View ViewModel (MVVM)

  Το Model όπως πριν. 

  Το View όπως πριν.

  Το ViewModel είναι μια αντικατάσταση του Controller που κάνει ένα data binding μεταξύ των Model elements και του UI και αλλάζει το UI όταν αλλάζουν τα Model elements.

  Τα UI elements είναι observers των Model elements.

* Model 

* Master-Slave / Master-Replica

  Load balancing. "Worker" nodes. Replication (multiple "slaves" which work on data copies)

* Share-nothing architecture

  * Non-sql systems

* Message driven / Publish subscribe

  * publisher (producer)
  * subscriber (consumer)
  * topics (channels)
  * Message bus (broker): scheduling / administration of messages

  Τα μειονεκτήματα είναι ότι θες ένα middleware να χειρίζεται τα ετερογενή μηνύματα μεταξύ ετερογενών παραληπτών.

  Θετικά: υψηλή επίδοση

* Event drivens

  * Processes and signals
  * Traps / Interrupts

* Pipeline

  Ο sender στέλνει ένα μήνυμα στον receiver και το message περνάει μέσα από ένα σύνολο μετασχηματισμών (σύνθεση)

  Εφαρμογές:

  * functional programming

  * parallelism

    Observable design pattern

    Push paradigm. Ο client (observer) ενημερώνεται όταν το observable αλλάζει τιμή.

    Events & events handling λογική.

  

* Server Oriented Architecures.

  Τα SOA architectures μοιάζουν πολύ με τα message driven. Αυτό που γίνεται είναι ότι υπάρχει ένα service broker στο οποίο ο server κάνει publish και οι clients find.

* REST (Representational State Transfer)

  Έννοιες:

  * Resources
  * Representations
  * Requests
  * Responses

  Αρχές:

  * Client - server

    Πλήρης διαχωρισμός των ενδιαφερόντων τους (seperation of concerns).

  * Stateless

    O server δεν αποθηκεύει καμία πληροφορία για το state της εφαρμογής του client. 

    Το state της εφαρμογής του client είναι ευθύνη του client.

  * Cacheable

    O client πρέπει να μπορεί προσωρινά να αποθηκεύει προσωρινά responses από τον server. Ο server πρέπει να υποδεικνύει ποιά responses μπορούν να αποθηκευτούν και ποιά όχι.

  * Layered System

    O client πρέπει να βλέπει έναν server ανεξάρτητα αν ο server χωρίζεται σε επιμέρους τμήματα.

  * Uniform Interface

    Clients communicate with the server in a uniform manner.

  * Code on demand

    Ο client να μπορεί να εκτελέσει κώδικα που προέρχεται δυναμικά από τον server.

  Η ιδέα είναι ο client θέλει ορισμένα resources από τον server. Για να επικοινωνήσει το αίτημα του στον server χρησιμοποιεί ένα URI που προσδιορίζει ποιά resources θέλει και σε τι representation. Ο server παίρνει το αίτημα, το επεξεργάζεται και γυρνάει στον client το representation μαζί με ενδεχόμενα metadata. Ο client μπορεί να τροποποιήσει το αντίστοιχο resource. 



​	Βασική τεχνική: **HATEOAS**. Αυτό σημαίνει: Hypermedia As The Engine Of Application State. Δηλαδή ο client δίνει στον server το application state του μιλώντας του με hypermedia (όπως hyperlinks).

Δες περισσότερα για RESTful Web Services (API) στην ενότητα του Web.



### Technical debt

>  Technical debt (also known as design debt or code debt) is a concept in software development that reflects the implied cost of additional rework caused by choosing an easy solution now instead of using a better approach that would take longer. Technical debt can be compared to monetary debt.[3] If technical debt is not repaid, it can accumulate 'interest', making it harder to implement changes later on. Unaddressed technical debt increases software entropy. Technical debt is not necessarily a bad thing, and sometimes (e.g., as a proof-of-concept) technical debt is required to move projects forward. On the other hand, some experts claim that the "technical debt" metaphor tends to minimize the impact, which results in insufficient prioritization of the necessary work to correct it.[4][5]





Project restrictions:

* scope: what we want to achieve
* quality: how good we want to achieve it
* time: how fast we want to achieve it
* cost: how much are we willing to pay for it.

Usually, we control 2 of them.



### Software Requirements Specification

### IT roles

* Project/Product manager

* Architect

  * Tooling
  * Σημαντικές σχεδιαστικές αποφάσεις
  * Interfaces & Component & dependencies

* Team lead

* Senior dev

* Junior dev

* Quality assurance engineer

* UI engineer

* UX engineer

* Backend engineer

* Frontend engineer

* Full-stack engineer

* Database dev

* Business analyst

* Data scientist

* Customer support

* DevOps engineer

  

Content: food

UI: plate

UX: the discussion with the waitress





### Software from IT scope

1. version control

2. build automation

   * Dependencies management

     Μπορούμε να έχουμε:

     * Compile time dependencies
     * Run time dependencies

     Πολύ συχνά μιλάμε και για μεταβατικές εξαρτήσεις.

   * Code compilation

   * static code analysis & bug detection

   * Testing

   * Continuous integration

   * Source code base to software artifacts (.jar, .exe, .rpm., .deb). The software artifacts for each technology are called **technology stack**.

   * Publication to software artifacts repositories

     Πρακτικά είναι ανεβασμένες εκδόσεις κώδικα

   There are different software automation tools:

   * make (targets, prerequisites, commands, macros, topological sorting)

3. versioning

   * Semantic versioning: [major].[minor].[patch]
     * major: breaking change
     * minor: add new functionality which is backwards compatible
     * patch: small backwards compatible fixes

4. Releases:

   * Pre-release
   * Early Access
     * Alpha
     * Beta
     * Release candidate
   * Release (General Availability, GA)

   Για κάθε release πρέπει να κάνουμε τα αντίστοιχα:

   * Publish το artifact
   * Tag το commit με το published version number
   * Update version file
   * Commit
   * Push

5. staging deployment

6. production deployment

7. Coding conventions

   * Class, variables, methods
   * Στοίχιση κώδικα
   * Διάρθρωση και τοποθέτηση αρχείων

8. Tools used by everyone in the team

9. Επιμερισμός ευθυνών

   * Ποιός είναι αρμόδιος για τί;
   * Αποφυγή ορφανού κώδικα
   * Αποφυγή αποκλεισμένου κώδικα (μόνο ο Χ ξέρει τι κάνει το Y)

> The "bus factor" is the minimum number of team members
> that have to suddenly disappear from a project before the
> project stalls due to lack of knowledgeable or competent
> personnel





### Java

* Naming conventions:

  NameOfClass, nameOfMethod, nameOfVariable, nameOfField, NAME_OF_CONSTANT

* Maven substructure:

  * `src/main/java/`
  * `src/main/resources`
  * `src/test/java`
  * `src/test/resources`
  * `build/classes`

* Code:

  A file `Foo.java` which is placed in: `src/main/java/x/y/z/Foo.java` should begin with``package x.y.z` and have a `class Foo`. The built class is in: `build/classes/x/y/z/Foo.class`

* Test:

  A file `FooTest.java` which is placed in the directory `src/test/x/y/z/FooTest.java` should begin with `package x.y.z` and have a `class FooTest`. The built class goes in: `build/classes/x/y/z/FooTest.class`

* Java make tools

  * Apache Ant
  * Apache Ivy
  * Apache Maven
  * Gradle

* Java software artifacts:

  * Jar 
  * APK

  

### Αντικειμενοστραφής προγραμματισμός

Βασικές έννοιες:

* Instantiation / Classification: να δημιουργείς αντικείμενα μιας κλάσης

* Aggregation / Decomposition. A class can contain class attributes

* Generilization / Specialization. Η γενική κλήση συγκεντρώνει τα κοινά χαρακτηριστικά όλων των εξειδικεύσεων της

* Private state

* Grouping / Individualization

* Πολυμορφισμός: κοινή διεπαφή για αντικείμενα διαφορετικών τύπων

  * Καθολικός πολυμορφισμός

    * Παραμετρικός

    * Inclusion (παραμετρικός υποτύπων)

      Μια κατώτερη κλάσση στην ιεραρχία αλλάζει την συμπεριφορά μιας ανώτερης κλάσης.

  * Ad-hoc 

    * Overloading
    * Coercion (αυτόματες μετατροπές τύπων)



### UML

Modeling language to express and design documents, software, systems and more.

UML is NOT a methodology. Also, it is independent of the implementation language.

Support understanding of software to customers and development.

Concepts:

* Models: an abstraction describing subsets of a system
* View: depicts selected aspects of a model
* Notation: graphical or textual rules to depict views

Stereotype: a mechanism for extending the vocabulary (and thus the expressive power) of UML.



#### Use case diagrams

##### Include relation

Λέει σε τι επιμέρους κομμάτια γίνεται split μια ενέργεια. 

![](https://www.uml-diagrams.org/use-case-diagrams/use-case-include-split.png)

##### Generalization

Κάτι σαν να βάζεις επίπεδα abstraction.

Ότι για παράδειγμα, ένα withdraw cash ανήκει στην κατηγορία action Bank ATM Transaction.

![](https://i.stack.imgur.com/VThNF.png)



##### Extend

Action1 -> Action2

Action1 <<extends>> Action2, αυτό σημαίνει ότι μπορείς να κάνεις το Action2 χωρίς να κάνεις το Action1.





#### Class diagrams

A static overview of the system in terms of classes. It displays what interacts but not what happends when interactions occur.

It shows attributes and operations for each class.



##### UML class diagrams notations

* A class is a rectangle divided into:
  * Class name
  * Class atributes
  * Class operations
* Modifiers:
  * $-$ Private
  * $+ $ Public
  * $\#$ Protected
  * $/$ derived. Can be combined with others
  * Underlined: Static 

* Abstract classes in italics



##### Multiplicities

Τις βάζουμε στο edge end που αφορούν

0..1: zero or one instances

0..*: zero to infinity instances

1: exactly one instance

1..*: one or more instances



##### Association

Logical relation between entities (high level).

Μπορούμε να βάλουμε labels πάνω στα associations.

Πάνω στα labels μπορούμε να βάλουμε και τα reading directions.





##### Aggregation

Δείχνει ένα has-A αλλά η άλλη κλάση μπορεί να υπάρξει και μόνη της.



![](/home/giannis/ntua-lambda/softeng/aggregation.jpg)



Μια ρόδα μπορεί να υπάρχει χωρίς να ανήκει σε κάποιο αμάξι.



##### Composition

Και αυτό κάνει demonstrate μια "has-A" σχέση, αλλά εδώ τα πράγματα ειναι πιο σκληρά. Άμα πεθάνει η base class πεθαίνει και το άλλο class. 

![](/home/giannis/ntua-lambda/softeng/composition.jpg)

Δεν μπορεί να υπάρχει ένα αυθύπαρκτο leg.	



##### Realization / Implementation

Arrow meaning: source **realizes** dst.

Πάει πολύ για abstract classes / interfaces.

![](https://cdn.visual-paradigm.com/guide/uml/uml-class-diagram-tutorial/16-realization.png)



Δεν μπορείς να φτιάξεις ποτέ έναν owner. Όμως μπορείς να φτιάξεις έναν Person που κάνει implement τον Owner.



##### Inheritance

Arrow meaning: source **inherits** from dst.



![](https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/KP-UML-Generalization-20060325.svg/300px-KP-UML-Generalization-20060325.svg.png)



Μπορείς δηλαδή να φτιάξεις ένα Person που δεν είναι ούτε Student ούτε Professor.



##### Dependency

Το dependency σημαίνει ότι δεν υπάρχει σχέση foreign key, αλλά μπορεί να υπάρχει κάποια συνάρτηση που να παίρνει ως όρισμα ένα αντικείμενο μιας τέτοιας άλλης κλάσης. 

Για παράδειγμα, ένας Person μπορεί να σκοτώσει ένα Fish.



![](/home/giannis/ntua-lambda/softeng/dependency.jpg)





### Web



`scheme://[user:password@]host[:port]/path[?query][#fragment]`

* `scheme`: http, https
* `host`: www.wikipedia.org
* `port`: socket connection port. HTTPS uses 443, HTTP uses 80.
* `path`: index.html



#### URI vs URL

URI unique identifier αλλά όχι απαραίτητα και τρόπος να το βρεις (πχ μπορεί να λείπει ο host)

URL unique identifier + τον τρόπο να το βρεις.

URI: Ο Κώστας Μπαμπίσογλου

URL: Ο Κώστας Μπαμπίσογλου που μένει στην οδό τριών ιεραρχών.



#### AJAX

Asychronous Javascript and JSON.

Το HTTP αίτημα στέλνεται ασύγχρονα (σε ξεχωριστό thread από το thread φόρτωσης της σελίδας) και παρέχει ένα callback hook για το αποτέλεσμα.



#### Json 

text based πρότυπο για την κωδικοποίηση δεδομένων.

Κωδικοποίηση unicode.

Το πιο διαδομένο πρότυπο για web server και web client asynchronous communication.

Γιατί;

* Απλό
* Σταθερό
* Γρήγορο

JSON types:

* String
* Number
* Boolean
* NULL
* Array
* Object



#### RESTful Web Services (API)

* Http base url (REST endpoint)
* MimeTypes για representations
* HTTP methods: GET, PUT, PATCH, POST, DELETE



##### HTTP Methods

Request types for an http server.

* GET method

  Δίνεις: metadata, pagination (αν υποστηρίζεται)

  Ζητάς:

  * Για collections: τα στοιχεία ενός collection
  * Για items: τα στοιχεία ενός item

* PUT method

  Δίνεις: Collection/Item

  Ζητάς: Αντικατάσταση του υπάρχοντος collection/item.

* POST method

  Δίνεις: Item

  Ζητάς: Προσθήκη νέου element στο υπάρχον collection

* DELETE method

  Δίνεις: 

  Ζητάς: Διαγραφή του υπάρχοντος collection ή item.



Τα RESTful Web Services είναι ο απλούστερος τρόπος υλοποίησης ενός SOA.



### Monolithic applications vs Microservices.

![monolithic_vs_microservices](/home/giannis/Pictures/monolithic_vs_microservices.png)



Microservices: different PRODUCTS not projects. Products communicate Unix-style: end-points, pipes. Teams own products. Business-capabilities organization; Agile in software.



Decentralized governance and data management.

Design for failure. 

Infrastructure automation.





### Testing

Έχουμε διαφορετικές μορφές ελέγχου:

* Επιθεωρήσεις (reviews)
* Στατική ανάλυση (Static analysis)
* Δοκιμασίες ελέγχου (Test cases)



Επαλήθευση: παράγουμε το λογισμικό σωστά ;

Επιβεβαίωση: παράγουμε το σωστό λογισμικό ;



Σοβαρότητα των bugs:

* Critical
* Major
* Minor
* Trivial



Πλάνο δοκιμασιών:

* Έγγραφο
* Τι θα ελεγχθεί και πώς
* Παραδοτέα
* Εκτιμήσεις χρόνου/κόστους
* προγραμματισμός/εκπαίδευση



Επίπεδα δοκιμασιών:

* Unit testing

  Έλεγχος οντοτήτων λογισμικού.

* Integration test

  Να δούμε πως πολλές οντότητες του λογισμικού συνεργάζονται.

* System test

  Έλεγχος του συστήματος συνολικά. Πώς κάνει scale? Πώς ανταποκρίνεται ως σύνολο;

* Acceptance test

  Ο χρήστης τι λέει για το λογισμικό;

Μέθοδοι εκτέλεσης δοκιμασιών:

* Black box testing
* White box testing
* Gray box testing



Τύποι δοκιμασιών:

* smoke testing

  Είναι ένα προκαταρκτικό test για να δουμε αν το σύστημα έχει κάποια ελπίδα να δουλέψει.

* functional testing

  Επαλήθευση συμβατότητας με τις προδιαγραφές.

* usability testing

  A/B testing

* security testing

* performance testing

  Load testing: stress, spike, soak testing (production testing over a good period of time)

  Maximum usable capacity

  Acceptable response time

* regression testing

  Backwards compatibility

* bebugging

  Σφάλματα στον κώδικα για να δουμε αν οι δοκιμασίες τα βρίσκουν :eight_pointed_black_star:

* mutation testing

  Αλλαγή του κώδικα με στόχο το bebugging.



Που γίνονται τα διάφορα tests?

* Developer workstation (unit testing)
* Testing server (integration tests)
* Staging server (acceptance tests)
* Production server (production use)



##### Essential complexity vs Accidental Complexity

Accidental complexity arises from problems that engineers create and can solve.

Essential complexity are the problems that arise from user needs and cannot be removed.





