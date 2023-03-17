L1

  
1. 
a) Sa se insereze intr-o lista liniara un atom a dat dupa al 2-lea, al 4-lea, al 6-lea,....element. 
b) Definiti o functie care obtine dintr-o lista data lista tuturor atomilor care apar, pe orice nivel, dar in ordine inversa. De exemplu: (((A B) C) (D E)) --> (E D C B A) 
c) Definiti o functie care intoarce cel mai mare divizor comun al numerelor dintr-o lista neliniara. 
d) Sa se scrie o functie care determina numarul de aparitii ale unui atom dat intr-o lista neliniara. 
;a) insert an atom after the even positions
(defun ins (l i x)
    (cond 
        ((= (mod i 2) 0) (cons x (ins l (+ i 1 ) x)))
        ((null l) nil)
        (t (cons (car l) (ins (cdr l) (+ i 1) x)))
    )
)

;(print (ins '(1 2 3 4 5 6) 1 100))


;b)
(defun getatoms (l)
    (cond 
        ((null l) nil)
        ((listp (car l)) (append (getatoms (car l)) (getatoms (cdr l))))
        (t (append (list (car l)) (cdr l)))
        
    )
)

;(print (getatoms '(1 2 3 (1 2))))

;c) gcd list 
(defun gcd_ (a b)
    (cond 
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((< a b) (gcd_ b a))
        ((equal b 0) a)
        (T (gcd_ b (mod a b)))
    )
)

;(print (gcd '10 '20))
(defun gcdlist(a aux)
    (cond 
        ((null a) aux)
        (
            (listp (car a))
            (gcdlist (car a) aux)
        )
        (
            T 
            (atom a) 
            (gcdlist (cdr a) (gcd_ (car a) aux))
        )
    )

)

;(print (gcdlist '(32 16 32 (8 16) 72 A) 0))

;d) nr occurences elem in list
(defun count2 (x l c)
    (cond 
        ((null l) c)
        ((eq x (car l)) (count2 x (cdr l) (+ 1 c)))
        (t (count2 x (cdr l) c))
    )
)

;(print (count2 1 '(1 2 3 1 1 4) 0))

2. 
a) Definiti o functie care selecteaza al n-lea element al unei liste, sau NIL, daca nu exista. 
b) Sa se construiasca o functie care verifica daca un atom e membru al unei liste nu neaparat liniara. 
c) Sa se construiasca lista tuturor sublistelor unei liste. Prin sublista se intelege fie lista insasi, fie un element de pe orice nivel, care este lista. Exemplu: (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 
( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) ). 
d) Sa se scrie o functie care transforma o lista liniara intr-o multime. 
;a) return the nth elem of a list/ nil

(defun nThElem (l i n)
    (cond 
    ((null l)nil)
    ((eq i n) (car l))
    (t (nThElem (cdr l) (+ i 1) n))
    )
)

(defun solve (x n)
    (nThElem x 1 n)
)

;(print (solve '(1 2 3 4 5) 6))
;(print (solve '(1 2 3 4 5) 4))

;b) check if an atom is in a list not necessarily linear
(defun member2 (l x)
    (cond 
        ((null l) nil)
        ((eq (car l) x) t)
        ((listp (car l)) (member2 (car l) x))
        (t (member2 (cdr l) x))
    )
)

;(print (member2 '(1 2 3 (1 2 (4))) 5))


;c) list of all sublists
(defun build (l v)
    (cond 
    ((null l) v)
    ((listp (car l)) (build (car l) (append v (list (car l)))))
    (t (build (cdr l) v))
    )
)

(print (build '(1 2 (3 (4 5) (6 7)) 8 (9 10)) () ))

;d) linear list => set
(defun transform (l v)
    (cond 
        ((null l) v)
        ((not (member2 v (car l)))  (transform (cdr l) (append v (list (car l)))))
        (t (transform (cdr l) v))
    )
)

;(print (transform '(1 1 2 3 4 5 5) ()))

3. 
a) Definiti o functie care intoarce produsul a doi vectori. 
b) Sa se construiasca o functie care intoarce adancimea unei liste. 
c) Definiti o functie care sorteaza fara pastrarea dublurilor o lista liniara. 
d) Sa se scrie o functie care intoarce intersectia a doua multimi. 

a)	Definiti o functie care intoarce produsul a doi vectori.
; produs (a: lista, b: lista)
; a - primul vector
; b - al doilea vector

; Exemple:
; (produs '(1 2 3) '(4 5 6)) => 32
; (produs '(1 2 3 4) '(4 5 6)) => 32
; (produs '(1 2 3 4) '()) => 0
(defun produs (a b)
    (if (or (null a) (null b))
        0
        (+ (* (car a) (car b)) (produs (cdr a) (cdr b)))
    )
)

; b)Sa se construiasca o functie care intoarce adancimea unei liste.

; my_max(a: numar, b: numar)
; a - primul numar care se compara
; b - al doilea numar care se compara 

; adancime(a: lista, l: adancimea)
; a - lista pentru care se calculeaza adancimea
; l - adancimea listei care este calculata

; Exemple:
; (adancime '(5 (6 (7))) 0) => 2
; (adancime '(6 (2 3 (4) (5) (6 (7)))) 0) => 3
; (adancime '(7 (6 (2 3 (4) (5) (6 (7))))) 0) => 4

(defun my_max (a b)
    (if (> a b) a b)
)

(defun adancime (a l)
    (cond
        ((null a) l)
        ((listp (car a)) (my_max (adancime (car a) (+ l 1)) (adancime (cdr a) l)))
        (T (adancime (cdr a) l))
    )
)

; c)Definiti  o  functie  care  sorteaza  fara  pastrarea  dublurilor  o  lista liniara.

; insert(l: lista, e: element)
; l - lista in care trebuie inserat elementul
; e - elementul care trebuie inserat

; sortare(l: lista)
; l - lista care trebuie sortata

; Exemple: 
; (sortare '(1 3 2 5 6 7 7 3 9)) => (1 2 3 5 6 7 9)
; (sortare '(11 5 7 7 11)) => (5 7 11)

(defun insert (l e)
    (cond
        ((null l) (list e))
        ((equal (car l) e) l)
        ((< e (car l)) (cons e l))
        (T (cons (car l) (insert (cdr l) e)))
    )
)

(defun sortare (l)
    (cond
        ((null l) nil)
        (T (insert (sortare (cdr l)) (car l)))
    )
)

; d)Sa se scrie o functie care intoarce intersectia a doua multimi.

; remove_first(l: lista, e: element)
; l - lista din care elimina elementul 
; e - elementul pe care il elimina

; contains(l: lista, e: element)
; l - lista in care se cauta elementul 
; e - elementul care se cauta

; intersectie(l: lista, k: lista)
; l - prima multime
; e - a doua multime

; Exemple:
; (intersectie '(1 2 3 4 5) '(1 5 6 7 9)) => (1 5)
; (intersectie '(1 2 3 4 5) '(6 7 8)) => NIL

(defun remove_first (l e)
    (cond 
        ((null l) nil)
        ((equal (car l) e) (cdr l))
        (T (cons (car l) (remove_first (cdr l) e)))
    )
)

(defun contains (l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) T)
        (T (contains (cdr l) e))
     )
)

(defun intersectie (l k)
    (cond
        ((or (null l) (null k)) nil)
        ((contains k (car l)) (cons (car l) (intersectie (cdr l) (remove_first (cdr k) (car l)))))
        (T (intersectie (cdr l) k))
    )
)


4. 
a) Definiti o functie care intoarce suma a doi vectori. 
b) Definiti o functie care obtine dintr-o lista data lista tuturor atomilor care apar, pe orice nivel, dar in aceeasi ordine. De exemplu: 

(((A B) C) (D E)) --> (A B C D E) 
c) Sa se scrie o functie care plecand de la o lista data ca argument, inverseaza numai secventele continue de atomi. Exemplu: 

(a b c (d (e f) g h i)) ==> (c b a (d (f e) i h g)) 
d) Sa se construiasca o functie care intoarce maximul atomilor numerici dintr-o lista, de la nivelul superficial. 
;a) sum of two vectors
(defun sum2 (a b )
    (cond 
        ((null a) 0)
        ((null b) 0)
        (t (+ (car a) (car b) (sum2 (cdr a) (cdr b))))
    )
)

(print (sum2 '(1 2 3 4) '(-1 0 3 2)))

;d) max num at superficial level
(defun getmax (l m)
    (cond 
        ((null l) m)
        ((and (numberp (car l)) (> (car l) m)) (getmax (cdr l) (car l)))
        (t (getmax (cdr l) m))
    )
)

(print (getmax '(1 2 100 4 (200)) 0))
5. 
a) Definiti o functie care interclaseaza cu pastrarea dublurilor doua liste liniare sortate. 
b) Definiti o functie care substituie un element E prin elementele unei liste L1 la toate nivelurile unei liste date L. 
c) Definiti o functie care determina suma a doua numere in reprezentare de lista si calculeaza numarul zecimal corespunzator sumei. 
d) Definiti o functie care intoarce cel mai mare divizor comun al numerelor dintr-o lista liniara. 

;a) Definiti o functie care interclaseaza cu pastrarea dublurilor doua liste liniare sortate.

; Modelul matematic: 
;                  interclasare(l11...l1n, l21...l2n) = { 
;                                                       l2, l1=[] 
;                                                       l1, l2=[]
;                                                       l11 + interclasare(l12...l1n, l21...l2n), l11<l21
;                                                       l21 + interclasare(l11...l1n, l22...l2n), altfel
;                                                       }
; interclasare(L1: lista, L2: lista)
; L1 - prima lista cu elemente sortate
; L2 - a doua lista cu elemente sortate
; Functia returneaza o lista formata din interclasarea lui L1 cu L2, cu pastrarea dublurilor

(defun interclasare( l1 l2 )
    (cond
        ((null l1) l2)
        ((null l2) l1)
        ((<(car l1)(car l2)) (cons (car l1) (interclasare (cdr l1) l2)))
        (T (cons (car l2) (interclasare l1 (cdr l2))))
    )
)

; Cazuri de testare:
; (interclasare '() '())
; (interclasare '() '(1 3 6 8))
; (interclasare '(1 2 4 5) '())
; (interclasare '(1 2 4 5) '(1 3 6 8))
; (interclasare '(-12 -11 -5 2 4 5) '(-12 -12 3 6 88))

; ---------------------------------------------------------------------------------------------------------
; b) Definiti o functie care substituie un element E prin elementele unei liste L1 la toate nivelurile unei liste date L.

; Modelul matematic:
;                   substituie(l1...ln, E, L11...L1n) = {
;                                                        [], l=[]
;                                                        L11..L1n + substituie(l2...ln, E, L11...L1n), l1 e nr si l1=E
;                                                        l1 + substituie(l2...ln, E, L11...L1n), l1 e atom
;                                                        substituie(l1, E, L11...L1n) + substituie(l2...ln, E, L11...L1n), altfel (merge pe nivelurile inferioare)
;                                                       }
; substituie(L: lista, E: intreg, L1: lista)
; L - lista initiala, neliniara
; E - numarul pe care doresc sa il substitui cu elementele listei L1
; L1 - lista care contine elemenetele cu care va fi inlocuit elementul E din lista L
; Functia substituie toate aparitiile elementului E in lista L cu elemenetele listei L1

(defun substituie( L E L1 )
    (cond 
        ((null L) nil)
        ( (and (numberp(car L)) (= E (car L))) (append L1 (substituie (cdr L) E L1 ) ) ) ;cons daca vreau ca lista, nu ca elemente
        (  (atom(car L)) (cons (car L) (substituie (cdr L) E L1 ) ) )
        (T (cons (substituie  (car L) E L1 ) (substituie  (cdr L) E L1 )) )
    )
)

; Cazuri de testare:
; (substituie '(1 2 3) '2 '(100 101))
; (substituie '(1 2 3) '2 '((100) 101))
; (substituie '(1 2 3) '2 '((100 (103 104)) 101))
; (substituie '(1 2 (4 3 2 (2)) 3) '2 '(100 101))
; (substituie '(1 2 (4 3 2 (2)) 3) '3 '(100 (102) 101))

; ---------------------------------------------------------------------------------------------------------
; c) Definiti o functie care determina suma a doua numere in reprezentare de lista si calculeaza numarul zecimal corespunzator sumei.

; Modelul matematic:
;                   inversa_listei(L1..Ln, Col) = {
;                                                  Col, L = []
;                                                  inversa_listei(L2..Ln, L1 + Col), altfel
;                                                 }
; inversa_listei(L: lista, Col: lista)
; L - lista care se doreste a fi inversata
; Col - lista - metoda variabilei colectoare - in ea se vor depune elemenetele listei L in ordine inversa (fiind vida initial)
; Functia inverseaza lista L 

(defun inversa_listei(L Col)
    (cond
        ( (null L) Col)
        (T (inversa_listei (cdr L) (cons (car L) Col)) )
    )
)
; Cazuri de testare:
; (inversa_listei '(1 2 3) '())
; (inversa_listei '(1 2 3 2 1) '())

; Modelul matematic:
;                   nr(L1...Ln) = {
;                                  L1, n = 1
;                                  L1 + nr(L2...Ln)*10, altfel
;                                 }
; nr(L: lista)
; L - lista liniara numerica (contine doar cifre)
; Functia returneaza numarul format din cifrele listei L, in ordine inversa (motiv pentru care am nevoie de functie de inversare a unei liste)

(defun nr (L)
    (cond
        ( (and (numberp(car L)) (null (cdr L))) (car L))
        (T (+ (car L) (* (nr (cdr L)) 10) ))
    )
)

; Cazuri de testare:
; (nr '(1 2 3))
; (nr '(1 2 3 2))

; Modelul matematic:
;                   suma(l11...l1n, l21...l2n) = nr(inversa_listei(l11...l1n)) + nr(inversa_listei(l21...l2n))
; suma(l1: lista, l2: lista)
; l1 - lista care contine cifre 
; l2 - lista care contine cifre 
; Functia returneaza suma a doua numere in reprezentare de lista

(defun suma(l1 l2)
    (+ (nr (inversa_listei l1 '())) (nr ( inversa_listei l2 '())))
)

; Cazuri de testare:
; (suma '(1 2) '(3 4))
; (suma '(1 2) '(3 4 5))
; (suma '(1 2) '(3 0 9))

; ---------------------------------------------------------------------------------------------------------
; d) Definiti o functie care intoarce cel mai mare divizor comun al numerelor dintr-o lista liniara.

; Modelul matematic:
;                   cmmdc(a,b) = {
;                                 a, a=b
;                                 a+b, a=0 || b=0
;                                 cmmdc(a-b,b), a>b, b>0
;                                 cmmdc(a,b-a), b>a, a>0
;                                }
; cmmdc(a: intreg, b: intreg)
; a - un numar intreg
; b - un numar intreg
; Functia returneaza cel mai mare divizor comun al numerelor a si b-a

(defun cmmdc(a b)
    (cond
        ( (= a b) a)
        ( (or (= a 0) (= b 0)) (+ a b))
        ( (and (> b 0) (> a b) ) (cmmdc (- a b) b) )
        ( T (and (> a 0) (> b a) ) (cmmdc a (- b a)) )
        
    )
)

; Cazuri de testare:
; (cmmdc '0 '0)
; (cmmdc '2 '0)
; (cmmdc '0 '3)
; (cmmdc '2 '3)
; (cmmdc '2 '2)
; (cmmdc '27 '81)
; (cmmdc '27 '36)

; Modelul matematic:
;                   cmmdc_lista(l1...ln) = {
;                                           [], l=[]
;                                           l1, n=1
;                                           cmmdc_lista(cmmdc(l1,l2),l3...ln), altfel
;                                          }
; cmmdc_lista(L: lista)
; L - lista de numere, liniara
; Functia returneaza cel mai mare divizor comun al tuturor numerelor din lista L

(defun cmmdc_lista (L)
    (cond
        ((null L) nil)
        ((= (length L) 1) (car L) )
        ((cmmdc_lista ( cons (cmmdc (car L) (car (cdr L))) (cdr (cdr L)) )))
    )
)

; Cazuri de testare:
; (cmmdc_lista '(2 3 4))
; (cmmdc_lista '(27 54 81))
; (cmmdc_lista '(27 54 81 18))
; (cmmdc_lista '(100 100 100 200)

6.
a) Sa se scrie de doua ori elementul de pe pozitia a n-a a unei liste liniare. De exemplu, pentru (10 20 30 40 50) si n=3 se va produce (10 20 30 30 40 50). 
b) Sa se scrie o functie care realizeaza o lista de asociere cu cele doua liste pe care le primeste. De ex: (A B C) (X Y Z) --> ((A.X) (B.Y) (C.Z)). 
c) Sa se determine numarul tuturor sublistelor unei liste date, pe orice nivel. Prin sublista se intelege fie lista insasi, fie un element de pe orice nivel, care este lista. Exemplu: (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 (lista insasi, (3 ...), (4 5), (6 7), (9 10)). 
d) Sa se construiasca o functie care intoarce numarul atomilor dintr-o lista, de la nivel superficial. 

; 6.
; a) Sa  se  scrie  de  doua  ori  elementul  de  pe  pozitia  a  n-a  a  unei  liste liniare. 
;De exemplu, pentru (10 20 30 40 50) si n=3 se va produce (10 20 30 30 40 50).
; sbcl
;(load "l1.lsp")
;l-lista initiala
;n- pozitia pe care trebuie dublat numarul
(defun dublare (l n)
    (cond
        ((null l) nil)
        ((= n 1) (cons (car l) l))
        (T (cons (car l) (dublare (cdr l) (- n 1))))
    )
)
;(dublare '(10 20 30 40 50) 3)
;=> (10 20 30 30 40 50)
;(dublare '() 3) 
;=> NIL
;(dublare '(1 2 3 4 5 6 7) 8)
;=>(1 2 3 4 5 6 7)
;(dublare '(1 2 3 4 5 6 7) 4)
;=>(1 2 3 4 4 5 6 7)

; b) Sa  se  scrie  o  functie  care  realizeaza  o  lista  de  asociere  cu  cele  doualiste  pe  care  le  primeste. 
; De  ex:  (A  B  C)  (X  Y  Z) -->  ((A.X)  (B.Y) (C.Z)).
;l-prima lista din care se face append
;k-a doua lista din care se face append
(defun my_append (l k)
    (if (null l) 
        k
        (cons (car l) (my_append (cdr l) k))
    )
)

(defun asociere (l k)
    (cond
        ((and (null l) (null k)) nil)
        ((null l) (my_append (list (cons NIL (car k))) (asociere l (cdr k))))
        ((null k) (my_append (list (cons (car l) NIL)) (asociere (cdr l) k)))
        (T (my_append (list (cons (car l) (car k))) (asociere (cdr l) (cdr k))))
    )
)
;(asociere '(A B C Q) '(X Y Z T U))
;=> ((A . X) (B . Y) (C . Z) (Q . T) (NIL . U)) 
;(asociere '(A B C) '(X Y Z))
;=>((A.X)  (B.Y) (C.Z))
;(asociere '() '())
;=>NIL
;(asociere '() '(A B C)) 
;=>((NIL . A) (NIL . B) (NIL . C))

; c) Sa  se  determine  numarul  tuturor  sublistelor  unei  liste  date,  pe  orice nivel. 
;Prin sublista se intelege fie lista insasi, fie un element de pe orice nivel, care este lista. 
;Exemplu: (12 (3 (4 5) (6 7)) 8 (9 10)) => 5 (lista insasi, (3 ...), (4 5), (6 7), (9 10)).
;l=lista in care se cauta nr de subliste continute, de pe orice nivel
(defun nrLista (l)
    (cond
        ((atom l) 0)
        ((listp l) (+ 1 (apply '+ (mapcar 'nrLista l))))
    )
)
;(nrLista '(1 2 (3 (4 5) (6 7)) 8 (9 10)))
;=> 5
;(nrLista '(1 2 (3 (4 5) (6 7)) 8 ))
;=> 4
;(nrLista '(1 2 3 4 5 6)) 
;=>1
;(nrLista '())  
;=>0

; d) Sa se construiasca o functie care intoarce numarul atomilor dintr-olista, de la nivel superficial.
;l= lista in care se cauta nr atomilor de la nivel superficial
(defun countAtomi (l)
    (cond
        ((null l) 0)
        ((atom (car l)) (+ 1 (countAtomi (cdr l))))
        (T (countAtomi (cdr l)))
    )
)
;(countNumere '(1 2 s 5 (6) fg 5))
;=> 6
;(countNumere '(a b c d ))
;=> 4
;(countNumere '(a 1 ( 1 2 3 4) a b c 4))
;=> 6
;(countNumere '(a 1 ( 1 2 3 4) a )) 
;=> 3
 

7. 
a) Sa se scrie o functie care testeaza daca o lista este liniara. 
b) Definiti o functie care substituie prima aparitie a unui element intr-o lista data. 
c) Sa se inlocuiasca fiecare sublista a unei liste cu ultimul ei element. Prin sublista se intelege element de pe primul nivel, care este lista. Exemplu: (a (b c) (d (e (f)))) ==> (a c (e (f))) ==> (a c (f)) ==> (a c f) 

(a (b c) (d ((e) f))) ==> (a c ((e) f)) ==> (a c f) 
d) Definiti o functie care interclaseaza fara pastrarea dublurilor doua liste liniare sortate. 

;7. a)Sa se scrie o functie care testeaza daca o lista este liniara.
;liniarList(L : list)
;L - lista de input
;liniarList(l1..ln) = {
;       T, n = 0
;       F, n > 0, l1 = lista
;       liniarList(l2..ln), altfel
;}
(defun liniarList(l)
    (cond
        ((null l) T)
        ((listp (car l)) nil)
        (T ( liniarList(cdr l)))
    )
)

;(liniarList '(1 (2 3) (4 (5 (6)))))
;NIL

;(liniarList '(1 2 3 4))
;T

;---------------------------------------------------
;b)Definiti o  functie  care  substituie  prima  aparitie  a  unui  element dat intr-o lista data.
;replaceFirstEl(L : list, El : integer, Ot : integer)
;L - lista input care va fi modificata
;El - valoarea elementului care trebuie inlocuit
;Ot -  valoarea cu care trebuie inlocuit El
;replaceFirstEl(l1..ln, el, ot) = {
;   nil, n = 0
;   l1 = ot, n > 0, l1 = el
;   replaceFirstEl(l2..ln, el, ot), altfel
;}
(defun replaceFirstEl(l el ot)
    (cond
        ((null l) nil)
        ((eq (car l) el) (cons ot (cdr l)))
        (T (cons (car l) ( replaceFirstEl (cdr l) el ot)))
    )
)

;(replaceFirstEl '(1 2 3 4 5 6 7 6 4 6) 6 0)
;(1 2 3 4 5 0 7 6 4 6)

;(replaceFirstEl '(1 2 3 4 5 6 7 6 4 6) 9 0)
;(1 2 3 4 5 6 7 6 4 6

;---------------------------------------------------
;c)Sa  se  inlocuiasca  fiecare  sublista  a  unei  liste  cu  ultimul ei element. Prin sublista se intelege element de pe primul nivel, care este lista. Exemplu: (a (b c) (d (e (f)))) ==> (a c (e (f))) ==> (a c (f)) ==> (a c f)(a (b c) (d ((e) f))) ==> (a c ((e) f)) ==> (a c f)

;appendEl(L : list, k : integer)
;L - lista de input in care se va adauga k
;k - elementul de adaugat
;appendEl(l1..ln, k) = {
;   k, n = 0
;   l1 ∪ appendEl(l2..ln, k), altfel
;}
(defun appendEl(l k)
    (if (null l) 
        k
        (cons (car l) ( appendEl(cdr l) k))
    )
)

;reverseList(L : list)
;L - lista input care va fi in oglinda
;reverseList(l1..ln) = {
;   nil, n = 0
;   appendEl(reverseList(l2..ln), l1), altfel
;}
(defun reverseList(l)
    (if (null l)
        nil
        ( appendEl( reverseList (cdr l)) (list (car l)))
    )        
)

;lastElement(L : list)
;L - lista input in care va ramane doar ultimul element
;lastElement(l) = {
;   lastElement(k1), l - lista, n > 0; k1..kn = reverseList(l)
;   l, altfel; l - element

(defun lastElement(l)
    (if (listp l) 
        ( lastElement (car ( reverseList l)))
        l
    )
)
;(lastElement '(1 (2 3) (4 (5 (6 7)))))
;7

;replaceSub(L : list)
;L - lista input care va fi modificata
;replaceSub(l1..ln) = {
;   vida, n = 0
;   lastElement(l1) ∪ replaceSub(l2..ln), n >0, l1 = lista
;   l1 ∪ replaceSub(l2..ln), altfel
;}
(defun replaceSub(l)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons ( lastElement (car l)) (replaceSub(cdr l))))
        (T (cons (car l) ( replaceSub(cdr l))))
    )
)

;(replaceSub '(a (b c) (d (e (f)))))
;(A C F)

;(replaceSub '(1 2 3 4))
;(1 2 3 4)

;(replaceSub '(1 2 3 (4 5)))
;(1 2 3 5)

;---------------------------------------------------
;d)Definiti o functie care interclaseaza fara pastrarea dublurilor doua liste liniare sortate.

;mergeLists(L1 : list, L2 : list)
;L1 - lista input sortata crescator in care se va salva interclasarea
;L2 - lista input sortata crescator
;mergeLists(l1..ln, k1..km) = {
;   k1, n = 0
;   l1, m = 0
;   l1 ∪ mergeLists(l2..ln, k1..km), l1 < k1, n >0, m > 0
;   k1 ∪ mergeLists(l1..ln, k2..km), altfel
(defun mergeLists(a b)
    (cond
        ((null a) b)
        ((null b) a)
        ((<= (car a) (car b)) (cons (car a) ( mergeLists (cdr a) b)))
        (T (cons (car b) ( mergeLists a (cdr b))))
    )
)

;(mergeLists '(1 2 3 3) '(3 4 4 5 5 7))
;(1 2 3 3 4 4 5 7)

;removeDuplicates(L - list)
;L - lista de input din care se vor elimina dublurile
;removeDuplicates(l1..ln) = {
;   nil, n = 0
;   l1, n = 1
;   removeDuplicates(l2..ln), n1 > 1, l1 = l2
;   l1 + removeDuplicates(l2..ln), altfel
;}
(defun removeDuplicates(l)
    (cond
        ((null l) nil)
        ((null (cdr l)) (list (car l)))
        ((= (car l) (cadr l)) ( removeDuplicates (cdr l)))
        (T (cons (car l) ( removeDuplicates (cdr l))))
    )
)

;(removeDuplicates '(1 2 3 3 4 4 5 7))
;(1 2 3 4 5 7) 

;solve(L1 : list, L2 : list)
;L1 - lista de input sortata crescator
;L2 - lista de input sortata crescator
;solve(L1, L2) = {
;   removeDuplicates(mergeLists(L1, L2))
;}
(defun solve(a b)
    ( removeDuplicates( mergeLists a b))
)

;(solve '(1 2 3 3) '(3 4 4 5 5 7))
;(1 2 3 4 5 7)

;(solve '() '(1 2))
;(1 2)

;(solve '(1) '())
;(1)


8. 
a) Sa se elimine elementul de pe pozitia a n-a a unei liste liniare. 
b) Definiti o functie care determina succesorul unui numar reprezentat cifra cu cifra intr-o lista. De ex: (1 9 3 5 9 9) --> (1 9 3 6 0 0) 
c) Sa se construiasca multimea atomilor unei liste.Exemplu: (1 (2 (1 3 (2 4) 3) 1) (1 4)) ==> (1 2 3 4) 
d) Sa se scrie o functie care testeaza daca o lista liniara este o multime. 
;a) Write a function to eliminate the n-th element of a linear list.

; eliminateNthElem(l1l2...ln, n, pos) =
; = nil , if n = 0
; = eliminateNthElem(l2...ln, n, pos + 1), if  n = pos
; = {l1} U eliminateNthElem(l2...ln, n, pos + 1), otherwise


(defun eliminateNthElem(l n pos)
  (cond
    ((null l) nil)
    ((equal n pos) (eliminateNthElem (cdr l) n (+ 1 pos)))
    (t (cons (car l) (eliminateNthElem (cdr l) n (+ 1 pos))))
  )
)


(defun mainA(l n)
  (eliminateNthElem l n 0)
)


; b) Write a function to determine the successor of a number represented digit by digit as a list, without
;    transforming the representation of the number from list to number. Example: (1 9 3 5 9 9) --> (1 9 3 6 0
;    0)


; carry(a b c) = 
; = 1 , if a + b + c > 9
; = 0 , if a + b + c <= 9

(defun carry(a b c)
  (cond
    (( > (+(+ a b) c) 9) 1)
    (t 0)
  )
)

; digit(a b c) = 
; (a + b + c) mod 10 , if a + b + c > 9
; a + b + c , if a + b + c <=9

(defun digit(a b c)
  (cond
    (( > (+ (+ a b) c) 9) (mod (+ (+ a b) c) 10))
    (t (+ (+ a b) c))
  )
)

; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm) , otherwise

(defun myAppend(l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)

; myReverse(l1l2...ln) = 
; = nil , if n = 0
; = myAppend(myReverse(l2...ln), list(myReverse(l1))), if l1 is a list
; = myAppend(myReverse(l2...ln), list(l1)), otherwise


(defun myReverse(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (myReverse (cdr l)) (list (myReverse (car l)))))
    (t (myAppend (myReverse (cdr l)) (list (car l))))
  )
)

; myAdd(l1l2...ln, p1p2...pm, c, r) = 
; = c , if n = 0 and c = 1
; = nil , if n = 0 and c = 0
; = myAdd(l2...ln, nil, carry(l1, 0, c), {digit(l1, 0, c)} U r) , if m = 0
; = myAdd(nil, p2...pn, carry(0, p1, c), {digit(0, p1, c)} U r) , if n = 0
; = myAdd(l2...ln, p2...pn, carry(l1, p1, c), {digit(l1, p1, c)} U r) , otherwise

(defun myAdd(l p c r)
  (cond 
    ((and (and (null l) (null p)) (equal c 1)) (cons c r))
    ((and (and (null l) (null p)) (equal c 0)) r)
    ((null p) (myAdd (cdr l) nil (carry (car l) 0 c) (cons (digit (car l) 0 c) r)))
    ((null l) (myAdd nil (cdr p) (carry 0 (car p) c) (cons (digit 0 (car p) c) r)))
    (t (myAdd (cdr l) (cdr p) (carry (car l) (car p) c) (cons (digit (car l) (car p) c) r)))
  )
)

(defun mySuccessor(l)
  (myAdd (myReverse l) (list 1) 0 (list ))
)

; c) Write a function to return the set of all the atoms of a list.
;    Exemplu: (1 (2 (1 3 (2 4) 3) 1) (1 4)) ==> (1 2 3 4)


; linearizeList(l1l2...ln) = 
; = nil, if n = 0
; = myAppend(linearizeList(l1), (linearizeList(l2...ln))), if l1 is a list
; = {l1} U linearizeList(l2...ln) , if l1 is a number
; = linearizeList(l2...ln) , otherwise


(defun linearizeList(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (linearizeList (car l)) (linearizeList (cdr l))))
    ((atom (car l)) (cons (car l) (linearizeList (cdr l))))
    (t (linearizeList (cdr l)))
  )
)

; checkExistence(l1l2...ln, elem) = 
; = nil (false), if n = 0
; = true , if l1 = elem
; = checkExistence(l2...ln, elem) , otherwise

(defun checkExistence(l elem)
  (cond
    ((null l) nil)
    ((equal (car l) elem) t)
    (t (checkExistence (cdr l) elem))
  )
)

; toSet(l1l2...ln, r) = 
; = r, if n = 0
; = toSet(l2...ln, r) , if checkExistence(r, l1) = true
; = toSet(l2...ln, {l1} U r) , otherwise

(defun toSet(l r)
  (cond
    ((null l) r)
    ((checkExistence r (car l)) (toSet (cdr l) r))
    (t (toSet (cdr l) (myAppend r (list (car l)))))
  )
)

(defun mainC (l)
  (toSet (linearizeList l) (list))
)

; d) Write a function to test whether a linear list is a set.

; checkSet(l1l2...ln, r) = 
; = true, if n = 0
; = false, if checkExistence(r, l1) = true
; = checkSet(l2...ln, {l1} U r) , otherwise


(defun checkSet(l r)
  (cond
    ((null l) t)
    ((checkExistence r (car l)) nil)
    (t (checkSet (cdr l) (myAppend r (list (car l)))))
  )
)

9. 
a) Sa se scrie o functie care intoarce diferenta a doua multimi. 
b) Definiti o functie care inverseaza o lista impreuna cu toate sublistele sale de pe orice nivel. 
c) Dandu-se o lista, sa se construiasca lista primelor elemente ale tuturor elementelor lista ce au un numar impar de elemente la nivel superficial. Exemplu: (1 2 (3 (4 5) (6 7)) 8 (9 10 11)) => (1 3 9). 
d) Sa se construiasca o functie care intoarce suma atomilor numerici dintr-o lista, de la nivelul superficial. 
;a) Write a function to return the difference of two sets.

; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm) , otherwise

(defun myAppend (l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)

; checkExistence(l1l2...ln, elem) = 
; = false (nil) , if n = 0
; = true , if l1 = elem
; = checkExistence(l2...ln, elem) , otherwise

(defun checkExistence(l elem)
  (cond
    ((null l) nil)
    ((equal (car l) elem) t)
    (t (checkExistence (cdr l) elem))
  )
)

; diffSets(l1l2...ln, p1p2...pm, r) = 
; = p1p2...pm, if n = 0
; = diffSets(l2...ln, p1p2...pm, r) , if checkExistence(p1p2...pm, l1)
; = diffSets(l2...ln, p1p2...pm, r U {l1}) , otherwise


(defun diffSets(l p r)
  (cond
    ((null l) r)
    ((checkExistence p (car l)) (diffSets (cdr l) p r))
    (t (diffSets (cdr l) p (myAppend r (list (car l)))))
  )
)


(defun mainA(l p)
  (myAppend (diffSets l p (list )) (diffSets p l (list )))
)


;b) Write a function to reverse a list with its all sublists, on all levels.

; myReverse(l1l2...ln) = 
; = nil , if n = 0
; = myAppend(myReverse(l2...ln), list(myReverse(l1))), if l1 is a list
; = myAppend(myReverse(l2...ln), list(l1)), otherwise


(defun myReverse(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (myReverse (cdr l)) (list (myReverse (car l)))))
    (t (myAppend (myReverse (cdr l)) (list (car l))))
  )
)


; c) Write a function to return the list of the first elements of all list elements of a given list with an odd
;    number of elements at superficial level. Example:
;    (1 2 (3 (4 5) (6 7)) 8 (9 10 11)) => (1 3 9).


; oddNrOfElems(l1l2...ln, c) =
; = true , if n = 0 and c % 2 = 1
; = false (nil) , if n = 0 and c % 2 = 0
; = oddNrOfElems(l2...ln, c + 1) , otherwise

(defun oddNrOfElems(l c)
  (cond
    ((and (null l) (equal 1 (mod c 2))) t)
    ((and (null l) (equal 0 (mod c 2))) nil)
    (t (oddNrOfElems (cdr l) (+ 1 c)))
  )
)

(defun checkOdd(l)
  (oddNrOfElems l 0)
)

; firstElem(l1l2...ln, f) = 
; = nil , if n = 0
; = myAppend(firstElem(l1, 0), firstElem(l2...ln, f)) , if l1 is a list
; = {l1} U firstElem(l2...ln, 1) , if checkOdd(l1l2...ln) is true and f = 0
; = firstElem(l2...ln, 1) , otherwise

(defun firstElem(l f)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (firstElem (car l) 0) (firstElem (cdr l) f)))
    ((and (checkOdd l) (= f 0)) (cons (car l) (firstElem (cdr l) 1)))
    (t (firstElem(cdr l) 1))
  )
)

(defun mainC(l)
  (firstElem l 0)
)


; d) Write a function to return the sum of all numerical atoms in a list at superficial level.

; sum(l1l2...ln) = 
; = 0 , if n = 0
; = l1 + sum(l2...ln), if l1 is a number
; = sum(l2...ln), otherwise


(defun sum(l)
  (cond
    ((null l) 0)
    ((numberp (car l)) (+ (car l) (sum (cdr l))))
    (t (sum (cdr l)))
  )
)
10. 
a) Sa se construiasca o functie care intoarce produsul atomilor numerici dintr-o lista, de la nivelul superficial. 
b) Sa se scrie o functie care, primind o lista, intoarce multimea tuturor perechilor din lista. De exemplu: (a b c d) --> ((a b) (a c) (a d)(b c) (b d) (c d)) 
c) Sa se determine rezultatul unei expresii aritmetice memorate in preordine pe o stiva. Exemple: 

(+ 1 3) ==> 4 (1 + 3) 
(+ * 2 4 3) ==> 11 ((2 * 4) + 3) 
(+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 - (2 * 2)) 
d) Definiti o functie care, dintr-o lista de atomi, produce o lista de perechi (atom n), unde atom apare in lista initiala de n ori. De ex: 
(A B A B A C A) --> ((A 4) (B 2) (C 1)). 
;a)Sa  se  construiasca  o  functie  care  intoarce  produsul  atomilor  numerici dintr-o lista, de la nivelul superficial.

;l - lista pe care calculam produsul superficial
(defun produsSuperficial(l)
    (cond
        ((null l) 1)
        ((numberp (car l)) (* (car l) (produsSuperficial (cdr l))))
        (T (produsSuperficial (cdr l)))
    )
)
(print (produsSuperficial '(1 2 (3 4) 4)))
;b)Sa  se  scrie  o  functie  care,  primind  o  lista,  intoarce  multimea  tuturor perechilor din lista. De exemplu: (a b c d) --> ((a b) (a c) (a d)(b c) (b d) (c d))

;e - elementul cu care facem perechi
;l - lista cu care facem perechile
(defun pereche(e l) 
    (cond
        ((null l) ())
        (T (cons (list e (car l)) (pereche e (cdr l))))
    )
)

;l - lista pe care facem perechi
(defun perechi(l)
    (cond
        ((null l) ())
        (T (append (pereche (car l) (cdr l)) (perechi (cdr l)) ))
    )
)

(print (perechi '(A B C D)))

;c)Sa se determine rezultatul unei expresii aritmetice memorate in preordine pe o stiva. 
;Exemple:(+ 1 3) ==> 4 (1 + 3)   (+ * 2 4 3) ==> 11 ((2 * 4) + 3)(+ * 2 4 -5 * 2 2) ==> 9 ((2 * 4) + (5 -(2 * 2))

;operator - operator matematic
;a - primul operand
;b - al doilea operand
(defun calcul(operator a b)
    (cond 
        ((string= operator "+")(+ a b))
        ((string= operator "-")(- a b))
        ((string= operator "*")(* a b))
        ((string= operator "/")(floor a b))
    )
)
;l - lista expresia data in preordine
(defun expresie(l)
    (cond
        ((null l) nil)
        ( (and (atom (car l)) (numberp (cadr l)) (numberp (caddr l)) ) (cons (calcul (car l) (cadr l) (caddr l)) (expresie (cdddr l))))
        (T (cons (car l) (expresie (cdr l))))
    )
)
;l - lista expresia data in preordine, in final va fi un numar
(defun rezultat(l)
    (cond
        ((null (cdr l)) (car l))
        (T (rezultat (expresie l) ))
    )
)

(print (rezultat '(+ * 2 4 - 5 * 2 2)))


;d)Definiti  o  functie  care,  dintr-o  lista  de  atomi,  produce  o  lista  de perechi (atom n), unde atom apare in lista initiala de n ori. De ex:(A B A B A C A) --> ((A 4) (B 2) (C 1)).

;l - lista in care numaram aparitiile elementului e
;e - elementul pe care il cautam in lista
(defun nrAparitii(l e)
    (cond
        ((null l) 0)
        ((equal (car l) e) (+ 1 (nrAparitii (cdr l) e)))
        (T (nrAparitii (cdr l) e))
    )
)
;(print (nrAparitii '(A B A B B A C) 'B))

;l - lista din care stergem toate elementele e
;e - elementul pe care il stergem
(defun removeAp(l e)
    (cond
        ((null l) nil)
        ((equal e (car l)) (removeAp (cdr l) e))
        (T (cons (car l) (removeAp (cdr l) e)))
    )
)
;(print (removeAp '(A B A B B A C) 'B))

;l - lista pe care numaram aparitiile fiecarui element din lista
(defun perechiNr(l)
    (cond
        ((null l) nil)
        (T (cons (list (car l) (nrAparitii l (car l))) (perechiNr (removeAp l (car l)))))
    )
)

(print (perechiNr '(A B A B A C A)))
11. 
a) Sa se determine cel mai mic multiplu comun al valorilor numerice dintr-o lista neliniara. 
b) Sa se scrie o functie care sa testeze daca o lista liniara formata din numere intregi are aspect de "munte"(o secvență se spune ca are aspect de "munte" daca elementele cresc pana la un moment dat, apoi descresc. De ex. 10 18 29 17 11 10). 
c) Sa se elimine toate aparitiile elementului numeric maxim dintr-o lista neliniara. 
d) Sa se construiasca o functie care intoarce produsul atomilor numerici pari dintr-o lista, de la orice nivel. 
;a) Determine the least common multiple of the numerical values of a nonlinear list.

; myGCD(a, b) = 
; = a , if b is not a number
; = b , if a is not a number
; = a , if b = 0
; = myGCD(b, a%b) , otherwise

(defun myGCD(a b)
  (cond
    ((not (numberp b)) a)
    ((not (numberp a)) b)
    ((equal 0 b) a)
    (t (myGCD b (mod a b)))
  )
)

; myLCM(a, b) = 
; = a , if b is not a number
; = b , if a is not a number
; = a * b / myGCD(a, b) , otherwise


(defun myLCM(a b)
  (cond
    ((not (numberp b)) a)
    ((not (numberp a)) b)
    (t (/ (* a b) (myGCD a b)))
  )
)


; lookForNumbers(l1l2...ln) = 
; nil , if n = 0
; lookForNumbers(l1) or lookForNumbers(l2...ln) , if l1 is a list
; true , if l1 is a number
; lookForNumbers(l2...ln) , otherwise


(defun lookForNumbers (l)
  (cond
    ((null l) nil)
    ((listp (car l)) (or (lookForNumbers (car l)) (lookForNumbers (cdr l))))
    ((numberp (car l)) t)
    (t (lookForNumbers (cdr l)))
  )
)

; lcmForList(l1l2...ln) = 
; = l1 , if n = 1
; = myLCM(lcmForList(l1) , lcmForList(l2...ln)) , if l1 is a list
; = myLCM(l1, lcmForList(l2...ln) , otherwise  


(defun lcmForList(l)
  (cond
    ((null (cdr l)) (car l))
    ((listp (car l)) (myLCM (lcmForList (car l)) (lcmForList (cdr l))))
    (t (myLCM (car l) (lcmForList (cdr l))))
  )
)

; First we check if we have any numbers in the list, if we don't have any numbers , we return 1, otherwise we go
; look for the least common multiple in the entire list on each level
(defun mainA(l)
  (cond
    ((lookForNumbers l) (lcmForList l))
    (t 1)
  )
)



; b) Write a function to test if a linear list of numbers has a "mountain" aspect (a list has a "mountain"
;    aspect if the items increase to a certain point and then decreases.
;    Eg. (10 18 29 17 11 10). The list must have at least 3 atoms to fullfil this criteria.

; f = 0 for an increasing sequence
; f = 1 for a decreasing sequence
; mountain(l1l2...ln, f) = 
; = true , if n <= 1 and f = 1
; = mountain(l2...ln, 0), if l1 <= l2 and f = 0
; = mountain(l2...ln, 1), if l1 >= l2 and f = 0
; = mountain(l2...ln, 1), if l1 >= l2 and f = 1
; = false , otherwise


(defun mountain(l f)
  (cond
    ((and (null (cdr l)) (= f 1)) t)
    ((and (<= (car l) (cadr l)) (= f 0)) (mountain (cdr l) 0))
    ((and (>= (car l) (cadr l)) (= f 0)) (mountain (cdr l) 1))
    ((and (>= (car l) (cadr l)) (= f 1)) (mountain (cdr l) 1))
    (t nil)
  )
)

; mainB(l1l2...ln) = 
; = nil (false) , if n = 0
; = nil (false) , if n = 1
; = nil (false) , if n = 2
; = mountain(l1l2...ln, 0) , otherwise

;In order to check for the mountain aspect, our list need to have at least 3 elements
(defun mainB(l)
  (cond
    ((null l) nil)
    ((null (cadr l)) nil)
    ((null (caddr l)) nil)
    (t (mountain l 0))
  )
)


; c) Remove all occurrences of a maximum numerical element from a nonlinear list.

; myMax(a, b) = 
; = a , if b is not a number
; = b , if a is not a number
; = a , if a > b
; = b , otherwise

(defun myMax(a b)
  (cond
    ((not (numberp b)) a)
    ((not (numberp a)) b)
    (( > a b) a)
    (t b)
  )
)

; maxForList(l1l2...ln) = 
; = nil , if n = 0
; = myMax(maxForList(l1), maxForList(l2...ln)) , if l1 is a list
; = myMax(l1, maxForList(l2...ln)) , otherwise


(defun maxForList(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myMax (maxForList (car l)) (maxForList (cdr l))))
    (t (myMax (car l) (maxForList (cdr l))))
  )
)


; myAppend (l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm) , otherwise

(defun myAppend (l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)


; removeElem(l1l2...ln, elem) = 
; = nil , if n = 0
; = removeElem(l1, elem) U removeElem(l2...ln, elem) , if l1 is a list
; = removeElem(l2...ln, elem) , if l1 = elem
; = {l1} U removeElem(l2...ln, elem) , otherwise

(defun removeElem(l elem)
  (cond
    ((null l) nil)
    ((listp (car l)) (cons (removeElem (car l) elem) (removeElem (cdr l) elem)))
    ((equal (car l) elem) (removeElem (cdr l) elem))
    (t (cons (car l) (removeElem (cdr l) elem)))
  )
)


(defun mainC (l)
  (removeElem l (maxForList l))
)

;d) Write a function which returns the product of numerical even atoms from a list, to any level.


; isEven(a) = 
; = t , if a % 2 = 1
; = nil (false) , otherwise


(defun isEven (a)
  (cond
    ((equal 0 (mod a 2)) t)
    (t nil)
  )
)

; productEvenNumbers(l1l2...ln) = 
; = 1, if n = 0
; = productEvenNumbers(l1) * productEvenNumbers(l2...ln) , if l1 is a list
; = l1 * productEvenNumbers(l2...ln) , if l1 is a number and is even
; = productEvenNumbers(l2...ln) , otherwise


(defun productEvenNumbers(l)
  (cond
    ((null l) 1)
    ((listp (car l)) (* (productEvenNumbers (car l)) (productEvenNumbers (cdr l))))
    ((and (numberp (car l)) (isEven (car l))) (* (car l) (productEvenNumbers (cdr l))))
    (t (productEvenNumbers (cdr l)))
  )
)


; First we check if we have any numbers in the list, if we have then we try to compute the product
; Otherwise we simply return 0
(defun mainD(l)
  (cond
    ((lookForNumbers l) (productEvenNumbers l))
    (t 0)
  )
)
12. 
a) Definiti o functie care intoarce produsul scalar a doi vectori. 
b) Sa se construiasca o functie care intoarce maximul atomilor numerici dintr-o lista, de la orice nivel. 
c) Sa se scrie o functie care intoarce lista permutarilor unei liste date. 
d) Sa se scrie o functie care intoarce T daca o lista are numar par de elemente pe primul nivel si NIL in caz contrar, fara sa se numere elementele listei. 
; Problema 1
; produsScalar(x1,y1,x2,y2) = x1*x2+y1*y2
; x1 int - coordonata pe axa OX a primului vector
; y1 int - coordonata pe axa OY a primului vector
; x2 int - coordonata pe axa OX al doilea vector
; y2 int - coordonata pe axa OY al doilea vector
(defun produsScalar(vector1_x vector1_y vector2_x vector2_y)
    (+ (* vector1_x vector2_x) (* vector1_y vector2_y))
)

; Problema 2
; MAX(a, b) = a; a > b
;             b; altfel
; a int - numar de comparat
; b int - numar de comparat
;                 -inf; n = 0
; maxim(l1..ln) = MAX(l1, maxim(l2..ln)); l1 - atom numeric
;                 maxim(l2..ln); l1 - atom
;                 MAX(maxim(l1), maxim(l2..ln)); altfel
; l1..ln list - lista din care se determina maximul
(defun maxim(l)
    (cond
        ((null l) -9999999)
        ((numberp (car l)) (MAX (car l) (maxim (cdr l))))
        ((atom (car l)) (maxim (cdr l)))
        (t (MAX (maxim (car l)) (maxim (cdr l))))
    )
)

; Problema 3
; ins(e, n, l1..lk) = (e l1..lk); n = 1
;                     l1 (+) ins(e, n - 1, l2..lk) altfel
; e int - numarul care sa se adauge in lista
; n int - pozitia pe care sa se adauge in lista
; l1..lk lista - lista in care sa se adauge numarul e
(defun ins(e n l)
    (cond
        ((= n 1) (cons e l))
        (t (cons (car l) (ins e (- n 1) (cdr l))))
    )
)

; insert(e, n, l1..lk) = vida; n = 0
;                        ins(e,n,l1..lk) (+) insert(e,n-1,l1..lk) altfel
; e int - numarul de adaugat in liste pe toate pozitiile
; n int - pozitiile pe care sa se adauge in lista
; l1..lk lista - lista in care se adauga pe fiecare pozitie numarul e
(defun insert(e n l)
    (cond
        ((= n 0) nil)
        (t (cons (ins e n l) (insert e (- n 1) l)))
    )
)

; inserare(e, l1..ln) = insert(e,n+1,l1..ln)
; e int - numarul de adaugat in lista pe fiecare pozitie
; l1..ln lista - lista in care se adauga elementul e pe fiecare pozitie
(defun inserare(e l)
    (insert e (+ (length l) 1) l)
)

; auxPem(e, l1..ln) = vida; n = 0
;                     inserare(e, l1) (+) auxPem(e, l2..ln); altfel
; e int - adauga elementul e in fiecare sublista din l1..ln
; l1..ln lista - lista cu liste
(defun auxPem(e l)
    (cond
        ((null l) nil)
        (t (append (inserare e (car l)) (auxPem e (cdr l))))
    )
)

;                     vida; n = 0
; permutari(l1..ln) = (l1); n = 1
;                     inserare(l1, l2); n = 2
;                     auxPem(l1, permutari(l2..ln)); altfel
; l1..ln - lista caruia sa ii se faca toate permutarile posibile
(defun permutari(l)
    (cond
        ((null l) nil)
        ((null (cdr l)) l)
        ((null (cddr l)) (inserare (car l) (cdr l)))
        (t (auxPem (car l) (permutari (cdr l))))
    )
)

; Problema 4
;                       t; n = 0
; lungimePara(l1..ln) = false; n = 1
;                       lungimePara(l3..ln); n > 2
; l1..ln lista - lista de verificat daca are numar par sau impar de elemente
(defun lungimePara(l)
    (cond
        ((null l) t)
        ((null (cdr l)) nil)
        (t (lungimePara(cddr l)))
    )
)

13. 
a) Sa se intercaleze un element pe pozitia a n-a a unei liste liniare. 
b) Sa se construiasca o functie care intoarce suma atomilor numerici dintr-o lista, de la orice nivel. 
c) Sa se scrie o functie care intoarce multimea tuturor sublistelor unei liste date. Ex: Ptr. lista ((1 2 3) ((4 5) 6)) => ((1 2 3) (4 5) ((4 5) 6)) 
d) Sa se scrie o functie care testeaza egalitatea a doua multimi, fara sa se faca apel la diferenta a doua multimi. 
;a) Sa se intercaleze un element pe pozitia a n-a a unei liste liniare.

; x - numarul pe care vrem sa il inseram
; l1 ... ln - lista de numere in care vrem sa inseram
; n - cate pozitii mai avem pana sa inseram elementul

;insert(x l1 ... ln n) = {
;                          l1 U insert(x l2 ... ln n - 1) : n != 0
;                          x  U l2 ... ln : n == 0
;                        }

(defun insert (x l n)
    (if (= n 0)  ; daca am ajuns la pozitia pe care vreau sa inserez adaug x in lista
        (cons x l)  
    (cons (car l) (insert x (cdr l) (1- n))) ; altfel inserez x in restul listei si concatenez primul element cu noua lista prelucrata
))

;b) Sa se construiasca o functie care intoarce suma atomilor numerici dintr-o
;lista, de la orice nivel.

;sum(l1...ln) = {
;                 l1 + sum(l2...ln): l1 este numar
;                 sum(l1) + sum(l2...ln): l1 este lista
;                 sum(l2 ... ln) : l1 nu este nici lista nici numar
;                 0: lista este vida
;               }

(defun sum(l) ; l reprezinta o lista de elemente
    (cond
        ((null l) 0) ; daca lista este goala returnez 0
        ((numberp (car l)) (+ (car l) (sum (cdr l)))) ; daca primul elemente din lista este numar il adun sumei si fac suma restul elementelor 
        ((atom (car l)) (sum (cdr l)) ) ; daca elementul nu este lista si nici numar, atunci trec peste
        (t (+ (sum (car l)) (sum (cdr l)) )) ; altfel fac suma listei curente si suma restul elementelor
    )
)
;c) Sa se scrie o functie care intoarce multimea tuturor sublistelor unei
;liste date. Ex: Ptr. lista ((1 2 3) ((4 5) 6)) => ((1 2 3) (4 5) ((4 5) 6))

;sublists(l1....ln) = {
;                       l: l nu e lista sau e lista vida
;                       l1 U sublists(l1) U sublists(l2...ln): l1 lista
;                       sublists(l2...ln): l1 nu e lista
;                     }

(defun sublists(l) ; l este reprezinta o lista de elemente
    (cond 
        ((atom l) l)   ; daca l nu este lista sau este o lista goala returnez o lista goala 
        ((listP (car l)) (append (list (car l)) (sublists (car l)) (sublists (cdr l))))  ; l1 = lista, atunci reunesc sublistele din l1 cu  multimile din restul listei
        (t (sublists (cdr l))) ; daca l1 != lista, returnez multimiile din restul listei
    )
)

;d) Sa se scrie o functie care testeaza egalitatea a doua multimi, fara sa se
;faca apel la diferenta a doua multimi.

; findE(e, l1 l2 ... ln) =  {
;                               false: l nu este o lista
;                               true:  l1 = e
;                               findE(e, l2 ... ln) : l1 != e
;                           }

;e elementul pe care vreau sa il caut
;l lista in care caut elementul

(defun findE (e l)      
    (cond
       ((atom l) nil) ;daca l nu este o lista returnez nil
       ((equal (car l) e) t) ;daca capul primul element din lista este egal cu e returnez true
       (t (findE e (cdr l))) ;altfel caut elementul in restul listei
    )
)

;equalSets(sa1 ... san, sb1 ... sbm) = {
;                                        false: n != m
;                                        false: daca nu gasesc toate elementele din prima multime in a doua
;                                        true:  daca gasesc toate elementele din prima multime in a doua
;                                      }

;s1 o lista de numere reprezentand prima multime
;s2 o lista de numere reprezentand a doua multime

(defun equalSets (s1 s2)
    (cond
        ((not (equal (length s1) (length s2))) nil) ; daca nu au aceeasi lungime returnez nil
        ((not (searchElements s1 s2)) nil) ;daca nu gasesc toate elementele din prima multime in a doua returnez nil
        (t t) ; altfel returnez true
    )
)

;l1 prima multime 
;l2 a doua lista

(defun searchElements (l1 l2) ;verific daca elementele din prima lista se gasesc
    (cond                     ; in cea dea doua lista folosind findE
        ((equal l1 ()) t)
        ((listP l1) (and (findE (car l1) l2) (searchElements (cdr l1) l2)))
        (t nil)
    )
)

;searchElements(la1 la2 ... lan, lb1 lb2 ... lbm) = {
;                                                       true: la este vida
;                                                       findE(la1, lb1 lb2 ... lbm) && searchElements(la2 ... lan, lb1 ... lbm): la este lista
;                                                       false: la nu este lista
;                                                   }


14. 
a) Dandu-se o lista liniare, se cere sa se elimine elementele din N in N. 
b) Sa se scrie o functie care sa testeze daca o lista liniara formata din numere intregi are aspect de "vale"(o secvență se spune ca are aspect de "vale" daca elementele descresc pana la un moment dat, apoi cresc. De ex. 10 8 6 17 19 20). 
c) Sa se construiasca o functie care intoarce minimul atomilor numerici dintr-o lista, de la orice nivel. 
d) Sa se scrie o functie care sterge dintr-o lista liniara toate aparitiile elementului maxim numeric. 
; a) A linear list is given. Eliminate from the list all elements from N to N steps, N-given.

; ----Here is solved the problem with the wrong understanding!!!
; removeFromNtoN(l1l2...ln, N, C1, C2) = 
; = nil , if n = 0
; = {l1} U removeFromNtoN(l2...ln, N, C1 + 1, C2), if C1 != N or C1 = C2 + 1= N
; = removeFromNtoN(l2...ln, N, C1, C2 + 1), if C2 != N + 1 and C1 = N

;(defun removeFromNtoN(l n c1 c2)
;  (cond
;    ((null l) nil)
;    ((or (not (equal c1 n)) (and (equal c1 (+ 1 c2)) (equal (+ 1 c2) n))) (cons (car l) (removeFromNtoN (cdr l) n (+ c1 1) c2)))
;    ((and (not (equal c2 (+ 1 n))) (equal c1 n)) (removeFromNtoN (cdr l) n c1 (+ c2 1)))
;  )
;)

;(defun mainA(l n)
;  (removeFromNtoN l n 0 0)
;)



; removeFromNtoN(l1l2...ln, n, k) = 
; = nil, if n = 0 
; = removeFromNtoN(l2...ln, n, n), if k = 1
; = {l1} U removeFromNtoN(l2...ln, n, k - 1) , otherwise

(defun removeFromNtoN(l n k)
  (cond 
    ((null l) nil)
    ((equal k 1) (removeFromNtoN (cdr l) n n))
    (t (cons (car l) (removeFromNtoN (cdr l) n (- k 1))))
  )
)

(defun mainA(l n)
  (removeFromNtoN l n n)
)


; b) Write a function to test if a linear list of integer numbers has a "valley" aspect (a list has a valley
;    aspect if the items decrease to a certain point and then increase. Eg. 10 8 6 17 19 20). A list must have
;    at least 3 elements to fullfill this condition.


; findLength(l1l2...ln) = 
; = 0 , if n = 0
; = 1 + findLength(l2...ln) , otherwise

(defun findLength(l)
  (cond
    ((null l) 0)
    (t (+ 1 (findLength (cdr l))))
  )
)


; valley(l1l2...ln, decreasing) = 
; = nil (false), if n = 1 and decreasing = true
; = true , if n = 1 and decreasing = false
; = nil (false) , if l1 > l2 and decreasing = false
; = valley(l2...ln, false), if l1 < l2 and decreasing = true
; = valley(l2...ln, decreasing), otherwise

(defun valley (l decreasing)
	(cond
		((= (findLength l) 1) (if decreasing nil T))
		((and (> (car l) (cadr l)) (not decreasing)) nil)
		((and (< (car l) (cadr l)) decreasing) (valley (cdr l) nil))
		(T (valley (cdr l) decreasing))
	)
)

(defun mainB(l)
  (cond
    ((null l) nil)
    ((null (cadr l)) nil)
    ((null (caddr l)) nil)
    ((< (car l) (cadr l)) nil)
    (t (valley l T))
  )
)


;c) Build a function that returns the minimum numeric atom from a list, at any level.

; myMin(a, b) = 
; = nil , if a is not a number and b is not a numbe
; = a , if b is not a numbe
; = b , if a is not a number
; = a , if a < b
; = b , otherwise

(defun myMin(a b)
  (cond
    ((and (not (numberp a)) (not (numberp b))) nil)
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((< a b) a)
    (t b)
  )
)


; findMin(l1l2...ln) = 
; = l1 , if n = 1 and l1 is an atom
; = myMin(findMin(l1), findMin(l2...ln)) , if l1 is a list
; = myMin(l1, findMin(l2...ln)) , otherwise


(defun findMin(l)
  (cond
    ((and (null (cdr l)) (atom (car l))) (car l))
    ((listp (car l)) (myMin (findMin (car l)) (findMin (cdr l))))
    (t (myMin (car l) (findMin (cdr l))))
  )
)
15. 
a) Sa se scrie o functie care intoarce reuniunea a doua multimi. 
b) Sa se construiasca o functie care intoarce produsul atomilor numerici dintr-o lista, de la orice nivel. 
c) Definiti o functie care sorteaza cu pastrarea dublurilor o lista liniara. 
d) Definiti o functie care construiește o listă cu pozițiile elementului minim dintr-o listă liniară numerică. 
; a) Write a function to return the union of two sets.

; removeFirstOcc(l1l2...ln, elem) =
; = nil, if n = 0
; = l2...ln, if l1 = elem
; = {l1} U removeFirstOcc(l2...ln, elem) , otherwise

(defun removeFirstOcc(l elem)
  (cond
    ((null l) nil)
    ((equal (car l) elem) (cdr l))
    (t (cons (car l) (removeFirstOcc (cdr l) elem)))
  )
)

; unionSets(l1l2...ln, p1p2...pm) = 
; = nil if n = 0 and m = 0
; = l1l2...ln, if m = 0
; = p1p2...pm, if n = 0
; = {l1} U unionSets(l2...ln, removeFirstOcc(p1p2...pm, l1)) , otherwise

(defun unionSets(l1 l2)
  (cond
    ((and (null l1) (null l2)) nil)
    ((null l1) l2)
    ((null l2) l1)
    (t (cons (car l1) (unionSets (cdr l1) (removeFirstOcc l2 (car l1)))))
  )
)


;c) Write a function to sort a linear list with keeping the double values.

; insertOk(l1l2...ln, elem) = 
; = list(elem), if n = 0
; = {elem} U l1l2...ln, if elem < l1 
; = {l1} U insertOk(l2...ln, elem) , otherwise


(defun insertOk(l elem)
  (cond
    ((null l) (list elem))
    ((< elem (car l)) (cons elem l))
    (t (cons (car l) (insertOk (cdr l) elem)))
  )
)

; mySort(l1l2...ln) = 
; = nil , if n = 0
; = mySort(insertOk(l2...ln, l1)) , otherwise


(defun mySort(l)
  (cond
    ((null l) nil)
    (t (insertOk (mySort (cdr l)) (car l)))
  )
)

; d) Build a list which contains positions of a minimum numeric element from a given linear list.

; myMin(a, b) = 
; = nil , if a is not a number and b is not a number
; = a , if b is not a number
; = b , if a is not a number
; = a , if a < b
; = b , otherwise

(defun myMin(a b)
  (cond
    ((and (not (numberp a)) (not (numberp b))) nil)
    ((not (numberp a)) b)
    ((not (numberp b)) a)
    ((< a b) a)
    (t b)
  )
)


; minList(l1l2...ln) = 
; = l1 , is n = 1 and l1 is an atom
; = myMin(minList(l1), minList(l2...ln)), if l1 is a list; = myMin(l1, minList(l2...ln)), otherwise


(defun minList(l)
  (cond 
    ((and (null (cdr l)) (atom (car l))) (car l))
    ((listp (car l)) (myMin (minList (car l)) (minList (cdr l))))
    (t (myMin (car l) (minList (cdr l))))
  )
)


; minPos(l1l2...ln, min, pos) = 
; = nil, if n = 0
; = pos U minPos(l2...ln, min, pos + 1) , if l1 = min
; = minPos(l2...ln, min, pos + 1), otherwise


(defun minPos (l min pos)
  (cond
    ((null l) nil)
    ((equal (car l) min) (cons pos (minPos (cdr l) min (+ 1 pos))))
    (t (minPos (cdr l) min (+ 1 pos)))
  )
)

(defun mainD (l)
  (minPos l (minList l) 0)
)
L2

 Un arbore binar se memoreaza in urmatoarele doua moduri 
(nod nr-subarbori lista-subarbore-1 lista-subarbore-2 ...) (1) 
(nod (lista-subarbore-1) (lista-subarbore-2)) (2) 
De exemplu arborele 
 A 
/ \ 
B C 
/ \ 
D E 
se poate reprezenta astfel in cele doua moduri: 
(A 2 B 0 C 2 D 0 E 0) (1) 
(A (B) (C (D) (E))) (2) 
Exceptand problemele 6 and 7, nu este permisa conversia intre tipuri – se vor folosi metode directe. 

1. Se da un arbore de tipul (1). Sa se afiseze calea de la radacina pana la un nod x dat. 

; 1. For a given tree of type (1) return the path from the root node to a certain given node X.


; pargurg_st(l1l2...ln, nrNoduri, nrMuchii) = 
; = nil, if n = 0
; = nil, if nrNoduri = 1 + nrMuchii
; = {l1} U {l2} U parcurg_st(l3...ln, nrNoduri + 1, l2 + nrMuchii), otherwise

(defun parcurg_st (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri ( + 1 nrMuchii)) nil)
    (t (cons (car l) (cons (cadr l) (parcurg_st (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))))
  )
)


; parcurg_dr(l1l2...ln, nrNoduri, nrMuchii) =
; = nil, if n = 0
; = l1l2...ln, if nrNoduri = 1 + nrMuchii
; = parcurg_dr(l3...ln, nrNoduri + 1, nrMuchii + l2), otherwise


(defun parcurg_dr (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri (+ 1 nrMuchii)) l)
    (t (parcurg_dr (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))
  )
)


;stang(l1l2...ln) = 
; = parcurg_st(l3...ln, 0,0)

(defun stang(l)
  (parcurg_st (cddr l) 0 0)
)


;drept(l1l2...ln) =
; = parcurg_dr(l3...ln, 0, 0)

(defun drept(l)
  (parcurg_dr (cddr l) 0 0)
)


; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwise

(defun myAppend(l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)


; checkExistence(l1l2...ln, elem) = 
; = true, if l1 = elem
; = false , if n = 0
; = checkExistence(l2...ln, elem), otherwise


(defun checkExistence(l elem)
  (cond
    ((null l) nil)
    ((equal (car l) elem) t)
    (t (checkExistence (cdr l) elem))
  )
)


(defun checkExistenceLeft(l elem)
  (checkExistence (stang l) elem)
)

(defun checkExistenceRight(l elem)
  (checkExistence (drept l) elem)
)


; path(l1l2...ln, elem) = 
; = nil, if n = 0
; = list(elem), if elem = l1
; = {l1} U path(drept(l1l2...ln), elem), if checkExistenceRight(l, elem) = true
; = {l1} U path(stang(l1l2...ln), elem), if checkExistenceLeft(l, elem) = true


(defun path(l elem)
  (cond
    ((null l) nil)
    ((equal (car l) elem) (list elem))
    ((checkExistenceRight l elem) (cons (car l) (path (drept l) elem)))
    ((checkExistenceLeft l elem) (cons (car l) (path (stang l) elem)))
  )
)


2. Sa se tipareasca lista nodurilor de pe nivelul k dintr-un arbore de tipul 
(1). 
; 2. Return the list of nodes on the k-th level of a tree of type (1).


; pargurg_st(l1l2...ln, nrNoduri, nrMuchii) = 
; = nil, if n = 0
; = nil, if nrNoduri = 1 + nrMuchii
; = {l1} U {l2} U parcurg_st(l3...ln, nrNoduri + 1, l2 + nrMuchii), otherwise

(defun parcurg_st (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri ( + 1 nrMuchii)) nil)
    (t (cons (car l) (cons (cadr l) (parcurg_st (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))))
  )
)


; parcurg_dr(l1l2...ln, nrNoduri, nrMuchii) =
; = nil, if n = 0
; = l1l2...ln, if nrNoduri = 1 + nrMuchii
; = parcurg_dr(l3...ln, nrNoduri + 1, nrMuchii + l2), otherwise


(defun parcurg_dr (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri (+ 1 nrMuchii)) l)
    (t (parcurg_dr (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))
  )
)


;stang(l1l2...ln) = 
; = parcurg_st(l3...ln, 0,0)

(defun stang(l)
  (parcurg_st (cddr l) 0 0)
)


;drept(l1l2...ln) =
; = parcurg_dr(l3...ln, 0, 0)

(defun drept(l)
  (parcurg_dr (cddr l) 0 0)
)


; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwise

(defun myAppend(l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)


; nodes(l1l2...ln, counter, level) = 
; = nil, if n = 0 
; = l1 , if counter = level
; = myAppend(nodes(stang(l1l2...ln), (c + 1), level), nodes(drept(l1l2...ln), (c + 1), level)), otherwise


(defun nodes(l counter level)
  (cond
    ((null l) nil)
    ((equal counter level) (list (car l)))
    (t (myAppend (nodes (stang l) (+ 1 counter) level) (nodes (drept l) (+ 1 counter) level)))
  )
)

(defun main(l level)
  (nodes l 0 level)
)
3. Se da un arbore de tipul (1). Sa se precizeze numarul de niveluri din 
arbore. 
; 3. Return the number of levels of a tree of type (1).


; pargurg_st(l1l2...ln, nrNoduri, nrMuchii) = 
; = nil, if n = 0
; = nil, if nrNoduri = 1 + nrMuchii
; = {l1} U {l2} U parcurg_st(l3...ln, nrNoduri + 1, l2 + nrMuchii), otherwise

(defun parcurg_st (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri ( + 1 nrMuchii)) nil)
    (t (cons (car l) (cons (cadr l) (parcurg_st (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))))
  )
)


; parcurg_dr(l1l2...ln, nrNoduri, nrMuchii) =
; = nil, if n = 0
; = l1l2...ln, if nrNoduri = 1 + nrMuchii
; = parcurg_dr(l3...ln, nrNoduri + 1, nrMuchii + l2), otherwise


(defun parcurg_dr (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri (+ 1 nrMuchii)) l)
    (t (parcurg_dr (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))
  )
)


;stang(l1l2...ln) = 
; = parcurg_st(l3...ln, 0,0)

(defun stang(l)
  (parcurg_st (cddr l) 0 0)
)


;drept(l1l2...ln) =
; = parcurg_dr(l3...ln, 0, 0)

(defun drept(l)
  (parcurg_dr (cddr l) 0 0)
)


; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwise

(defun myAppend(l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)


; myMax(a, b) = 
; = a , if a > b
; = b , otherwise

(defun myMax(a b)
  (cond
    ((> a b) a)
    (t b)
  )
)


; levels(l1l2...ln, counter) = 
; = counter, if n = 0
; = myMax(levels(stang(l1l2...ln), counter + 1), levels(drept(l1l2...ln), counter + 1)), otherwise


(defun levels(l counter)
  (cond
    ((null l) counter)
    (t (myMax (levels (stang l) (+ 1 counter)) (levels (drept l) (+ 1 counter))))
  )
)

(defun main(l)
  (levels l -1)
)

4. Sa se converteasca un arbore de tipul (2) la un arbore de tipul (1). 
(defun transform(l)
    (cond 
        ((null l) nil)      ;daca lista e vida returneaza nil
        ((null (cadr l)) (append (list (car l)) (list 0) ))     ;daca al doilea element(subarborele stang) din lista e null, se adauga 
                                                                ;la rezultat, lista formata din primul element l1 si lista formata din 0
        ((null (caddr l)) (append (list (car l)) (list 1) (transform (cadr l))))    ;daca al 3-lea element e null(subarborele drept)
                                                                                    ;se lipeste la rezultat lista formata din 
                                                                                    ;primul element din lista si lista de 1 , si 
                                                                                    ;rezultatul apelului recursiv pe subarborele stang
        (t (append (list (car l)) (list 2) (transform (cadr l)) (transform (caddr l))))
        ;altfel, se lipeste la lista rezultat, o lista formata din l1, lista de 2, rezultatul apelarii functiei pentru al doilea 
        ;element, si pentru al treilea
    )
)

; transform(l1l2...ln)= -[]            , daca l este vida
 ;                     -l1+0           , daca n=1
 ;                     -l1+1+transform(l2)   , daca n=2
 ;                     -l1+2+transform(l2)+transform(l3)   ,altfel

;(transform '(A (B) (C (D) (E))))
;(transform '(A (B (D) (E (F (G) (H)))) (C (I (J (K))))))
;(transform '(A (B (D)) (C)))
;(transform '(A (B () (F)) (D (E (K)) (L))))



5. Sa se intoarca adancimea la care se afla un nod intr-un arbore de tipul (1). 
;Return the level of a node in a tree of type 1.
;Note: if the node doesn't exist, the return value will be nil.

(defun explore (x node level children l)
        (cond
            ((eq x node) level)
            ((null l) nil)
            ((= children 0) l)
            (t 
                (setq new (explore x (car l) (+ level 1) (cadr l) (cddr l)))
                (cond 
                    ((listp new) (explore x node level (- children 1) new))
                    (t new)
                )
            )
        )
)

(defun solve (x l)
    (explore x (car l) 0 (cadr l) (cddr l))  
)
;(print (solve 'A (list 'A 2 'B 2 'D 0 'E 2 'F 1 'H 1 'I 0 'G 0 'C 2 'J 0 'K 1 'L 0)))
;(print (solve 'I (list 'A 2 'B 2 'D 0 'E 2 'F 1 'H 1 'I 0 'G 0 'C 2 'J 0 'K 1 'L 0)))
;(print (solve 'E (list 'A 2 'B 0 'C 2 'D 0 'E 0)))
;(print (solve 'F (list 'A 2 'B 0 'C 2 'D 1 'F 0 'E 0)))


(print (solve 'A(list 'A 2 'B 2 'C 2 'E 0 'F 1 'G 0 'D 1 'H 2 'I 0 'J 2 'K 0 'L 0 'M 2 'N 0 'O 2 'P 0 'Q 2 'R 0 'S 1 'T 0)))
(print (solve 'B(list 'A 2 'B 2 'C 2 'E 0 'F 1 'G 0 'D 1 'H 2 'I 0 'J 2 'K 0 'L 0 'M 2 'N 0 'O 2 'P 0 'Q 2 'R 0 'S 1 'T 0)))
(print (solve 'N(list 'A 2 'B 2 'C 2 'E 0 'F 1 'G 0 'D 1 'H 2 'I 0 'J 2 'K 0 'L 0 'M 2 'N 0 'O 2 'P 0 'Q 2 'R 0 'S 1 'T 0)))
(print (solve 'F(list 'A 2 'B 2 'C 2 'E 0 'F 1 'G 0 'D 1 'H 2 'I 0 'J 2 'K 0 'L 0 'M 2 'N 0 'O 2 'P 0 'Q 2 'R 0 'S 1 'T 0)))
(print (solve 'R(list 'A 2 'B 2 'C 2 'E 0 'F 1 'G 0 'D 1 'H 2 'I 0 'J 2 'K 0 'L 0 'M 2 'N 0 'O 2 'P 0 'Q 2 'R 0 'S 1 'T 0)))
(print (solve 'T(list 'A 2 'B 2 'C 2 'E 0 'F 1 'G 0 'D 1 'H 2 'I 0 'J 2 'K 0 'L 0 'M 2 'N 0 'O 2 'P 0 'Q 2 'R 0 'S 1 'T 0)))

6. Sa se construiasca lista nodurilor unui arbore de tipul (1) parcurs in 
inordine. 

;6. Sa se construiasca lista nodurilor unui arbore de tipul (1) parcurs in inordine.
;(A 2 B 0 C 2 D 0 E 0)


;parcurge_stanga(l1 l2 ... ln, nr_varfuri, nr_muchii) = vida, daca n=0 sau nr_muchii+1=nr_varfuri
;                                                      l1+l2+parcurge_stanga(l3 ... ln, nr_varfuri+1, nr_muchii+l2), altfel  
;parcurge_stanga(arbore,nr_varfuri,nr_muchii)
;arbore - lista ce reprezinta arborele
;nr_varfuri - nr de varfuri curent
;nr_muchii - nr de muchii curent

(defun parcurge_stanga(arbore nr_varfuri nr_muchii)

    (cond
        ((null arbore) nil)
        ((= nr_varfuri (+ 1 nr_muchii)) nil)
        ;(T (append (list (car arbore)) (list (cadr arbore)) (parcurge_stanga (cddr arbore) (+ 1 nr_varfuri) (+ (cadr arbore) nr_muchii))))
        (T (cons (car arbore) (cons (cadr arbore) (parcurge_stanga (cddr arbore) (+ 1 nr_varfuri) (+ (cadr arbore) nr_muchii)))))
    )
)


;parcurge_dreapta(l1 l2 ... ln, nr_varfuri, nr_muchii) = vida, daca n=0 
;                                                       l1 l2 ... ln, daca nr_muchii+1=nr_varfuri
;                                                      parcurge_dreapta(l3 ... ln, nr_varfuri+1, nr_muchii+l2), altfel  

;parcurge_dreapta(arbore,nr_varfuri,nr_muchii)
;arbore - lista ce reprezinta arborele
;nr_varfuri - nr de varfuri curent
;nr_muchii - nr de muchii curent

(defun parcurge_dreapta(arbore nr_varfuri nr_muchii)

    (cond
        ((null arbore) nil)
        ((= nr_varfuri (+ 1 nr_muchii)) arbore)
        (T (parcurge_dreapta (cddr arbore) (+ 1 nr_varfuri) (+ (cadr arbore) nr_muchii)))
    )

)

;stanga(l1 l2 ... ln) = parcurge_stanga(l3 l4 ... ln, 0, 0)
;stanga(arbore)
;arbore - lista ce reprezinta arborele
(defun stanga(arbore)

    (parcurge_stanga (cddr arbore) 0 0)
)


;dreapta(l1 l2 ... ln) = parcurge_dreapta(l3 l4 ... ln, 0, 0)
;dreapta (arbore)
;arbore - lista ce reprezinta arborele
(defun dreapta(arbore)

    (parcurge_dreapta (cddr arbore) 0 0)
)


(print (stanga '(A 2 B 0 C 2 D 0 E 0)))
(print (dreapta '(A 2 B 0 C 2 D 0 E 0)))


;inorder(l1 l2 ... ln)= vida, daca n=0
;                       inorder(stanga(l1 l2 ... ln)) + (l1) + inorder(dreapta(l1 l2 ... ln)) altfel
;inorder(arbore)
;arbore - lista ce reprezinta arborele
(defun inorder(arbore)
    (cond
        ((null arbore) nil)
        (T (append (inorder (stanga arbore) )  (list (car arbore))  (inorder (dreapta arbore) ) ) )
    )
)

(print (inorder '(A 2 B 0 C 2 D 0 E 0)))
7. Se da un arbore de tipul (1). Sa se precizeze nivelul pe care apare un nod 
x in arbore. Nivelul radacii se considera a fi 0. 
;                                 false; n = 0 vida
; nivelNodAux(l1..ln Nod Nivel) = Nivel;l1 = Nod, N = 1
;                                 false; n = 1, l1 != nod
;                                 nivelNodAux(l2 Nod Nivel+1); N = 2
;                                 nivelNodAux(l2 Nod Nivel+1) || nivelNodAux(l3 Nod Nivel+1); N = 3
; l1..ln lista - lista tip arbore in care se cauta
; Nod int - nodul caruia sa se afle nivelul in lista
; Nivel - nivelul curent pe care se afla un nod
(defun nivelNodAux(Arbore Nod Nivel)
    (cond
        ((null Arbore) nil)
        ((equal Nod (car Arbore)) Nivel)
        (t (OR (nivelNodAux (cadr Arbore) Nod (+ Nivel 1)) (nivelNodAux (caddr Arbore) Nod (+ Nivel 1))))
    )
)

; nivelNod(l1..ln Nod) = nivelNodAux(l1..ln Nod 0)
; l1..ln lista - lista tip arbore in care se cauta
; Nod int - nodul caruia sa se afle nivelul in lista
(defun nivelNod (Arbore Nod)
    (nivelNodAux Arbore Nod 0)
)
8. Sa se construiasca lista nodurilor unui arbore de tipul (2) parcurs in 
inordine. 
; 8. Return the list of nodes of a tree of type (2) accessed inorder.

; (car l) - the first element of the list is the root of the tree
; (cadr l) - the second element of the list, at superficial level, is the left subtree
; (caddr l) - the third element of the list, at the superficial level, is the right subtree


; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwise


(defun myAppend (l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)

; inorder(l1l2l3) = 
; = nil, if n = 0 
; = myAppend(inorder(l2), myAppend(list(l1), inorder(l3))), otherwise


(defun inorder(l)
  (cond
    ((null l) nil)
    (t (myAppend (inorder (cadr l)) (myAppend (list (car l)) (inorder (caddr l)))))
  )
)
9. Sa se converteasca un arbore de tipul (1) la un arbore de tipul (2). 
; 9. Convert a tree of type (1) to type (2).

; (A 2 B 0 C 2 D 0 E 1 F 0) -> (A (B) (C (D) (E (F))))

; pargurg_st(l1l2...ln, nrNoduri, nrMuchii) = 
; = nil, if n = 0
; = nil, if nrNoduri = 1 + nrMuchii
; = {l1} U {l2} U parcurg_st(l3...ln, nrNoduri + 1, l2 + nrMuchii), otherwise

(defun parcurg_st (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri ( + 1 nrMuchii)) nil)
    (t (cons (car l) (cons (cadr l) (parcurg_st (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))))
  )
)

; parcurg_dr(l1l2...ln, nrNoduri, nrMuchii) =
; = nil, if n = 0
; = l1l2...ln, if nrNoduri = 1 + nrMuchii
; = parcurg_dr(l3...ln, nrNoduri + 1, nrMuchii + l2), otherwise


(defun parcurg_dr (l nrNoduri nrMuchii)
  (cond
    ((null l) nil)
    ((= nrNoduri (+ 1 nrMuchii)) l)
    (t (parcurg_dr (cddr l) (+ 1 nrNoduri) (+ (cadr l) nrMuchii)))
  )
)

;stang(l1l2...ln) = 
; = parcurg_st(l3...ln, 0,0)

(defun stang(l)
  (parcurg_st (cddr l) 0 0)
)


;drept(l1l2...ln) =
; = parcurg_dr(l3...ln, 0, 0)

(defun drept(l)
  (parcurg_dr (cddr l) 0 0)
)

; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwise

(defun myAppend(l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)

; convert_back(l1l2..ln) = 
; = nil , if n = 0
; = myAppend(list(l1), convert_back(stang(l1l2...ln)) U list(convert_back(drept(l1l2...ln)))), if l2 = 1
; = myAppend(list(l1), list(convert_back(stang(l1l2...ln)))), if l2 = 1
; = list(l1), if l2 = 0

(defun convert_back(l)
  (cond
    ((null l) nil)
    ((equal (cadr l) 2) (myAppend (list (car l)) (cons (convert_back(stang l)) (list (convert_back(drept l))))))
    ((equal (cadr l) 1) (myAppend (list (car l)) (list (convert_back(stang l)))))
    (t (list (car l)))
  )
)

10. Se da un arbore de tipul (2). Sa se precizeze nivelul pe care apare un nod x in arbore. Nivelul radacii se considera a fi 0. 
; 10. Se da un arbore de tipul (2). Sa se precizeze nivelul pe care apare un nod
; x in arbore. Nivelul radacinii se considera a fi 0.
"""

(defun getLevel(tree node)
    (findLevel tree node 0)
)

(defun findLevel(tree node level)
    (cond 
        ((null tree) nil)
        ((equal (car tree) node) level)
        (t (or (findLevel (cadr tree) node (+ 1 level)) 
               (findLevel (caddr tree) node (+ 1 level))
            )
        )
    )
)

"""
tree - arbore de tipul (2)
node - nodul din arbore cautat
level - nivelul curent al radacinii subarborelui tree

getLevel(root left right, node) = findLevel(root left right, node, 0)

findLevel(l1 ... ln (n <= 3), node, level) =   {
                                        nil : l e vida
                                        level : l1 = node
                                        findLevel(l2, node, level + 1) | findLevel(l3, node, level + 1) : l are 3 elemente
                                        findLevel(l2, node, level + 1) | findLevel(nil, node, level + 1) : l are 2 elemente
                                        findLevel(nil, node, level + 1) | findLevel(nil, node, level + 1) : l are 1 element
                                      }

"""

11. Se da un arbore de tipul (2). Sa se afiseze nivelul (si lista corespunza- 
toare a nodurilor) avand numar maxim de noduri. Nivelul rad. se considera 0. 
; 11. Return the level (and coresponded list of nodes) with maximum number of nodes for a tree of type
; (2). The level of the root element is 0.

(defun get-level (tree level)
	(cond
		((null tree) nil)
		((= level 0) (list (car tree)))
		(T (append (get-level (cadr tree) (- level 1)) (get-level (caddr tree) (- level 1))))
	)
)

;(print (get-level '(1 (2 (3) (4)) (5 (6) (7))) 2))
; => '(3 4 6 7)

(defun _max-level (tree max lvl)
	(setf me (get-level tree lvl))
	(cond
		((null me) max)
		((> (list-length me) (list-length max)) (_max-level tree me (+ lvl 1)))
		(T (_max-level tree max (+ lvl 1)))
	)
)

;(print (_max-level '(1 (2 (3) (4)) (5 (6) (7))) '() 0))
; => '(3 4 6 7)

(defun max-level (tree)
	(_max-level tree '() 0)
)

(print (max-level  '(1 (2 (3) (4)) (5 (6) (7))) ) )
; => '(3 4 6 7)
12. Sa se construiasca lista nodurilor unui arbore de tipul (2) parcurs in 
preordine. 
; 12. Determine the list of nodes accesed in preorder in a tree of type (2).

; (car l) - the first element of the list is the root of the tree
; (cadr l) - the second element of the list, at superficial level, is the left subtree
; (caddr l) - the third element of the list, at the superficial level, is the right subtree


; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwise


(defun myAppend (l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)


; preorder(l1l2l3) = 
; = nil, if l1l2l3 is empty
; = myAppend(list(car l), myAppend(preorder(l2), preorder(l3))), otherwise

(defun preorder(l)
  (cond
    ((null l) nil)
    (t (myAppend (list (car l)) (myAppend (preorder (cadr l)) (preorder (caddr l)))))
  )
)
13. Se da un arbore de tipul (2). Sa se afiseze calea de la radacina pana la un 
nod x dat. 
; 13. Se da un arbore de tipul (2). Sa se afiseze calea de la radacina pana la un nod x dat.
;exista(L : list, E : atom)
; L - lista data ce reprezinta un arbore de tip (2)
; E - nodul cautat
; exista(l1..ln, e) = {
;   fals, n = 0
;   true, n = 1 si l1 = e
;   fals, n = 1 si l1 != e
;   exista(l2, e), n = 2 si l1 != e
;   exista(l2, e) ∨ exista(l3, e), n = 3 si l1 != e
;}

(defun exista (l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) t )
        (t (or ( exista (cadr l) e) ( exista (caddr l) e)))
    )
)

; calea(L : list, E : atom)
; L - lista data ce reprezinta un arbore de tip (2)
; E - nodul cautat
; calea(l1..ln, e) = {
;   Ø, exista(l1..ln, e) = fals
;   [e], n = 1, l1 = e
;   l1 ∪ calea(l2, e), n >= 2 si exista(l2, e) = true
;   l1 ∪ calea(l3, e), n = 3 si l1 != e,
;   Ø, altfel
;}

(defun calea (l e)
    (cond
        ((not ( exista l e)) nil)
        ((equal (car l) e)(list  e) )
        (( exista (cadr l) e) (cons (car l) ( calea (cadr l) e)))
        (t (cons (car l) ( calea (caddr l) e)))
    )
)

;        A
;       / \
;      B   C
;         /\
;        D  E
(print ( calea '(A (B) (C (D) (E))) 'D))
(print ( calea '(A (B) (C (D) (E))) 'A))
;        A
;       / \
;      B   C
;         /\
;        D  E
;          /
;         F
;        /\
;       G  H
(print ( calea '(A (B) (C (D) (E (F (G) (H))))) 'F))
(print ( calea '(A (B) (C (D) (E (F (G) (H))))) 'G))
(print ( calea '(A (B) (C (D) (E (F (G) (H))))) 'H))

14. Sa se construiasca lista nodurilor unui arbore de tipul (2) parcurs in 
postordine. 
; Problema 14. 
; Sa se construiasca lista nodurilor unui arbore de tipul (2) parcurs in postordine.

; Modelul matematic:
;                   postordine(l1 l2 l3) = {
;                                          [], l=[]
;                                          postordine(l2) + postordine(l3) + l1, altfel
;                                          }
; postordine(L: lista eterogena)
; l1 - nod 
; l2 - lista din stanga (aborele din stanga nodului l1)
; l3 - arborele din dreapta nodului l1, lista
; Functia returneaza lista nodurilor arborelui parcurs in postordine SDR

(defun postordine(L)
    (cond
        ((null L) nil)
        (t (append (postordine (cadr L)) (postordine (caddr L)) (list(car L))))
    )
)

; Cazuri de testare:
; (postordine '())
; (postordine '(A))
; (postordine '(A (B) (C (D) (E))))
; (postordine '(A (B (C) (D () (E))) (F () (G () (H (I (K)) (J))))))



; Pentru mine:

(defun preordine(L)
    (cond
        ((null L) nil)
        (t (append (list(car L)) (preordine (cadr L)) (preordine (caddr L)) ))
    )
)

(defun inordine(L)
    (cond
        ((null L) nil)
        (t (append (inordine (cadr L)) (list (car L)) (inordine (caddr L)) ))
    )
)


15. Sa se construiasca lista nodurilor unui arbore de tipul (1) parcurs in 
postordine. 
; 15.Sa se construiasca lista nodurilor unui arbore de tipul (1) parcurs in postordine.

; stanga (arbore: lista, varfuri: numar, muchii: numar)
; arbore - arborele care se parcurge la stanga
; varfuri - numarul de varfuri
; muchii - numarul de muchii

(defun stanga(arbore varfuri muchii)

    (cond
        ((null arbore) nil)
        ((= varfuri (+ 1 muchii)) nil)
        (T (cons (car arbore) (cons (cadr arbore) (stanga (cddr arbore) (+ 1 varfuri) (+ (cadr arbore) muchii)))))
    )
)

; dreapta (arbore: lista, varfuri: numar, muchii: numar)
; arbore - arborele care se parcurge la dreapta
; varfuri - numarul de varfuri
; muchii - numarul de muchii

(defun dreapta(arbore varfuri muchii)

    (cond
        ((null arbore) nil)
        ((= varfuri (+ 1 muchii)) arbore)
        (T (dreapta (cddr arbore) (+ 1 varfuri) (+ (cadr arbore) muchii)))
    )
)

; postordine (arbore: lista)
; arbore - arborele care se parcurge in postordine

(defun postordine(arbore)
    (cond
        ((null arbore) nil)
        (T (append (postordine (stanga (cddr arbore) 0 0) )  (postordine (dreapta (cddr arbore) 0 0) ) (list (car arbore))   ) )
    )
)

(print (postordine '(A 2 B 0 C 2 D 0 E 0)))
;(B D E C A)
(print (postordine '(A 2 B 2 C 0 D 0 E 1 F 0)))
;(C D B F E A)
(print (postordine '(A 1 B 1 C 0)));
;(C B A)

16. Sa se decida daca un arbore de tipul (2) este echilibrat (diferenta dintre adancimile celor 2 subarbori nu este mai mare decat 1).
; 16. Determine if a tree of type (2) is ballanced (the difference between the depth of two subtrees is equal to 1)


; absoluteDiff(a, b) = 
; = a - b, if a > b
; = b - a, otherwise


(defun absoluteDiff(a b)
  (cond
    ((> a b) (- a b))
    (t (- b a))
  )
)

; myMax(a, b) = 
; = a, if a > b
; = b, otherwise


(defun  myMax(a b)
  (cond
    ((> a b) a)
    (t b)
  )
)


; getDepth(l1l2l3) = 
; = 0, if l1l2l3 is null
; = 1 + myMax(getDepth(l2), getDepth(l3)), otherwise


(defun getDepth(l)
  (cond
    ((null l) 0)
    (t (+ 1 (myMax (getDepth (cadr l)) (getDepth (caddr l)))))
  )
)


; isBalanced(l1l2l3) = 
; = true, if n = 0
; =  nil, if absoluteDiff(getDepth(l2), getDepth(l3)) > 1
; = isBalanced(l2) and isBalanced(l3), otherwise


(defun isBalanced(l)
  (cond
    ((null l) t)
    ((> (absoluteDiff (getDepth (cadr l)) (getDepth (caddr l))) 1) nil)
    (t (and (isBalanced (cadr l)) (isBalanced (caddr l))))
  )
)


; (isBalanced '(A)) -> yes
; (isBalanced '(A (B (C) ()) ())) -> no
; (isBalanced '(A (B (C) ()) (D))) -> yes
; (isBalanced '(A (B (C) ()) (D (E () (F () (G))) ()))) -> no

L3


1.	Sa se construiasca o functie care intoarce adancimea unei liste. 
; 11. Write a function to determine the depth of a list.

; myMax(a, b)
; = nil, if a is not a number and b is not a number
; = a, if b is not a number
; = b, if a is not a number
; = a, if a > b
; = b, otherwise

(defun myMax(a b)
  (cond
    ((and (not (numberp a)) (not (numberp b))) nil)
    ((not (numberp b))a)
    ((not (numberp a)) b)
    ((> a b) a)
    (t b)
  )
)

; findMax(l1l2...ln)
; = nil, if n = 0
; = myMax(l1, findMax(l2...ln)), otherwise

(defun findMax(l)
  (cond
    ((null l) nil)
    (t (myMax (car l) (findMax (cdr l))))
  )
)


; findDepth(l1l2...ln, counter) = 
; = counter, if l is an atom
; = max(findDepth(l1, counter), findDepth(l2, counter), ..., findDepth(ln, counter)), otherwise


(defun findDepth(l counter)
  (cond
    ((atom l) counter)
    (t (apply #'findMax (list (mapcar #' (lambda (a) (findDepth a (+ 1 counter))) l))))
  )
)


(defun main(l)
  (findDepth l -1)
)

2. Definiti o functie care obtine dintr-o lista data lista tuturor atomilor 
care apar, pe orice nivel, dar in aceeasi ordine. De exemplu 
(((A B) C) (D E)) --> (A B C D E) 
;Write a function that produces the linear list of all atoms of a given list, fromall levels, and written in the same order.
;Eg.: (((A B) C) (D E)) --> (A B C D E)

(defun linearize(l)
    (cond 
        ((null l) l)
        ((atom l) (list l))
        (t (mapcan #' linearize l))
    )
)

(print (linearize '(((1 2) 3) (4 E))))

3. Sa se construiasca o functie care verifica daca un atom e membru al 
unei liste nu neaparat liniara.
; 1. Write a function to check if an atom is member of a list (the list is non-liniar)

; checkExistence(l elem) = 
; = true, if l = elem and l is an atom
; = false, if l != elem and l is an atom
; = checkExistence(l1 elem) or checkExistence(l2 elem) or ... or checkExistence(ln elem) , otherwise


(defun checkExistence(l elem)
  (cond
    ((and (atom l) (equal l elem)) t)
    ((atom l) nil) 
    (t (some #'identity (mapcar #'(lambda (a) (checkExistence a elem)) l)))
  )
)
 
4. Sa se construiasca o functie care intoarce suma atomilor numerici 
dintr-o lista, de la orice nivel. 
;4. Sa se construiascao functie care intoarce suma atomilor numerici dintr-o lista, de la orice nivel.


;suma(e)=e, daca e este numar
;        0, daca e este atom nenumeric
;        suma(e1)+suma(e2)+...+suma(en), unde e=(e1,e2...en)

;e - lista pentru care se vor insuma atomii numerici de la oricare nivel  
(defun suma(e)
    (cond
        ((numberp e) e)
        ((atom e) 0)
        ((listp e) (apply #'+(mapcar #' suma e)))
    )
)


(print (suma '(1 2 (3 (1) A) B (1) 9)))
5. Definiti o functie care testeaza apartenenta unui nod intr-un arbore n-ar 
reprezentat sub forma (radacina lista_noduri_subarb1... lista_noduri_ 
_subarbn) 
Ex: arborelele este (a (b (c)) (d) (e (f))) si nodul este 'b => adevarat 
;               false; daca n = 0
; sau(l1..ln) = adevarat; daca l1 este adevarat
;               sau(l2..ln); altfel
; l1..ln lista - lista cu valori adevarat sau fals care sa se faca
(defun sau(lista)
    (cond
        ((null lista) nil)
        ((car lista) t)
        (t (sau (cdr lista)))
    )
)

;                          false; daca n = 0
;apartenenta(l1..ln Nod) = adevarat; daca l1=Nod
;                          sau(apartenenta(l2), ..., apartenenta(ln))
; l1..ln lista - lista de tip arbore in care se cauta nodul Nod
; Nod int - atomul de cautat in lista daca exista
(defun apartenenta(Arbore Nod)
    (cond
        ((null Arbore) nil)
        ((equal Nod (car Arbore)) t)
        (t (funcall #'sau 
                (mapcar #'(lambda (Arbore) (apartenenta Arbore Nod)) (cdr Arbore))
           )
        )   
    )
)
6. Sa se construiasca o functie care intoarce produsul atomilor numerici 
dintr-o lista, de la orice nivel. 
; 4. Write a function that returns the product of numeric atoms in a list, at any level.

; myProduct(l) = 
; = l, if l is a number
; = 1, if l is an atom
; = myProduct(l1) * myProduct(l2) * ... * myProduct(ln), otherwise (if l is a list of the type l = l1l2...ln)

(defun myProduct(l)
  (cond
    ((numberp l) l)
    ((atom l) 1)
    (t (apply '* (mapcar #'myProduct l)))
  )
)
7. Sa se scrie o functie care calculeaza suma numerelor pare minus suma 
numerelor impare la toate nivelurile unei liste. 
; 5. Write a function that computes the sum of even numbers and then decrease the sum of odd numbers from that sum,
;    at any level of a list.


; findSign(a) = 
; = a, if a % 2 = 0
; = -a


(defun findSign(a)
  (cond
    ((equal 0 (mod a 2)) a)
    (t (- a))
  )
)

; totalSum(l)
; = findSign(l), if l is a number
; = 0, if l is an atom
; = totalSum(l1) + totalSum(l2) + ... + totalSum(ln), where l is a list of type l = l1l2...ln

(defun totalSum(l)
  (cond
    ((numberp l) (findSign l))
    ((atom l) 0)
    (t (apply '+ (mapcar #'totalSum l)))
  )
)
8. Sa se construiasca o functie care intoarce maximul atomilor numerici 
dintr-o lista, de la orice nivel. 
8 Sa se construiasca o functie care intoarce maximul atomilor numerici
 dintr-o lista, de la orice nivel.

maxim(l (l1 l2 ... ln)) = {
                            l1 : atom(l1) && l1 >= maxim(l2 ... ln)
                            maxim(l2 ... ln) : atom(l1) && l1 < maxim(l2 ... ln)
                            maxim(l1): maxim(l2 ... ln) < maxim(l1) && !atom(l1) 
                          }

"""

(defun maxim (l)
  (cond
    ((null l) 0)
    ((and (atom (car l)) (> (car l) (maxim (cdr l))) (car l)))
    ((atom (car l)) (maxim (cdr l)))
    ((> (maxim (car l)) (maxim (cdr l))) (maxim (car l)))
    (t (maxim (cdr l)))
  )
)

(defun maxim2(l)
  (cond 
    ((numberp l) l)
    ((not (atom l)) (getMaxim (mapcar #'maxim2 l)))
  )
)

(defun getMaxim(l)
  (cond
    ((null l) 0)
    ((not (numberp (car l))) (getMaxim (cdr l)))
    ((> (car l) (getMaxim(cdr l))) (car l))
    (t (getMaxim (cdr l)))
  )
)

9. Definiti o functie care substituie un element E prin elementele 
unei liste L1 la toate nivelurile unei liste date L. 
; 7. Write a function that substitutes an element E with all elements of a list L1 at all levels of a given list L.


; mySubstitute(l, elem, p) =
; = l , if l != elem and l is an atom
; = p , if l = elem and l is an atom
; = mySubstitute(l1, elem, p) U mySubstitute(l2, elem, p) U ... U mySubstitute(ln, elem, p), otherwise (if l is a list of the
; form l = l1l2...ln)


(defun mySubstitute(l elem p)
  (cond
    ((and (not (equal l elem)) (atom l))  l)
    ((and (equal l elem) (atom l)) p)
    (t (mapcar #' (lambda (l) (mySubstitute l elem p)) l))
  )
)
10. Definiti o functie care determina numarul nodurilor de pe nivelul k 
dintr-un arbore n-ar reprezentat sub forma (radacina lista_noduri_subarb1 
... lista_noduri_subarbn) Ex: arborelele este (a (b (c)) (d) (e (f))) si 
k=1 => 3 noduri 
; 8. Write a function to determine the number of nodes on the level k from a n-tree represented as follows:
;    (root list_nodes_subtree1 ... list_nodes_subtreen)
;     Eg: tree is (a (b (c)) (d) (e (f))) and k=1 => 3 nodes


; nrNodes(l, level, counter) = 
; = 1, if level = counter
; = 0, if level != counter
; = nrNodes(l1, level, counter) + nrNodes(l2, level, counter) + ... + nrNodes(ln, level, counter), otherwise


(defun nrNodes(l level counter)
  (cond
    ((and (atom l) (equal counter level)) 1)
    ((atom l) 0)
    (t (apply '+ (mapcar #' (lambda (a) (nrNodes a level (+ counter 1))) l)))
  )
)


(defun main(l level)
  (nrNodes l level -1)
)
11. Sa se scrie o functie care sterge toate aparitiile unui atom de la 
toate nivelurile unei liste.
;11.  Sa se scrie o functie care sterge toate aparitiile unui atom de la toate nivelurile unei liste.

; removeAux(l1l2...ln) = {
;   [], daca n = 0
;   removeAux(l2...ln), daca l1 este atom si l1 = []
;   {l1} U removeAux(l2...ln), daca l1 este atom
;   removeAux(l1) U removeAux(l2...ln), altfel
;}

(defun removeAux(l)
  (cond
    ((null l) nil)
    ((and (atom (car l)) (equal (car l) nil)) (removeAux (cdr l)))
    ((atom (car l)) (cons (car l) ( removeAux (cdr l))))
    (t (cons ( removeAux (car l)) ( removeAux (cdr l))))
  )
)

; removeElem(l, elem) = {
;   nil, daca l este atom si l = elem
;   l , daca l este atom si l != elem
;   removeElem(l1, elem) U removeElem(l2, elem) U ... U removeElem(ln, elem) , altfel
;}

(defun removeElem(l elem)
  (cond
    ((and (atom l) (equal l elem)) nil)
    ((atom l) l)
    (t (apply #'removeAux (list (mapcar #' (lambda (a) ( removeElem a elem)) l))))
  )
)

(print( removeElem '(a (b (c)) (d) (c (c))) 'c))
(print( removeElem '(a (b (c)) (d) (e (e) (e) (f (f)))) 'e))
(print( removeElem '(a (a (a)) (a) (a (b))) 'a))
(print( removeElem '(a (b (c)) (d) (c (c (c (c (d (f (c)))))))) 'c))


 
12. Definiti o functie care inlocuieste un nod cu altul intr-un arbore n-ar 
reprezentat sub forma (radacina lista_noduri_subarb1...lista_noduri_subarbn) 
Ex: arborelele este (a (b (c)) (d) (e (f))) si nodul 'b se inlocuieste cu 
nodul 'g => arborele (a (g (c)) (d) (e (f))) 
; 12. Definiti o functie care inlocuieste un nod cu altul intr-un arbore n-ar
; reprezentat sub forma (radacina lista_noduri_subarb1...lista_noduri_subarbn)
; Ex: arborelele este (a (b (c)) (d) (e (f))) si nodul 'b se inlocuieste cu
; nodul 'g => arborele (a (g (c)) (d) (e (f)))

; Modelul matematic:
;                   inlocuire(Radacina Sub1...Subn  DeInlocuit Inlocuitor) = {
;                                                                             Inlocuitor, Radacina = DeInlocuit si n = 1
;                                                                             Radacina, Radacina != DeInlocuit si n = 1
;                                                                             inlocuire(RadacinaluiSub1 DeInlocuit Inlocuitor) + inlocuire(RadacinaluiSub2 DeInlocuit Inlocuitor) + ... +inlocuire(RadacinaluiSubn DeInlocuit Inlocuitor)  , Radacina e lista
;                                                                             }

; inlocuiere(Arbore: lista eterogena, DeInlocuit: atom, Inlocuitor: atom)
; Radacina Sub1...Subn - forma de memorare a arborelui n-ar Arbore, cu radacina, urmata de lista tuturor subarborilor sai
; DeInlocuit - ce dorim sa inlocuim in Abore
; Inlocuitor - cu ce dorim sa inlocuim in Abore pe DeInlocuit
; Functia inlocuieste aparitia lui DeInlocuit in Abore cu Inlocuitor (!toate aparitiile, daca sunt mai multe)

(defun inlocuire (Arbore DeInlocuit Inlocuitor)
    (cond
        ( 
            (and (atom Arbore) ;am ajuns la un nod de tip radacina
            (eq Arbore DeInlocuit) ) Inlocuitor ; si returnez Inlocuitor daca Radacina subarborelui este egala cu DeInlocuit
        )  

        (
            (atom Arbore) Arbore ; altfel returnez Arbore (numar)     
        )
 
        ( (listp Arbore) ;daca este subarbore (lista)
          (mapcar #'(lambda (A) (inlocuire A DeInlocuit Inlocuitor)) Arbore) ; merg cu functia anonima lambda pe fiecare dintre 
          ; subarbori -> lista_noduri_subarb1...lista_noduri_subarbn, datorita mapcar
        
        ) 
    )
)

; Cazuri de testare:
; (inlocuire '(A (B) (C)) 'R 'T )
; (inlocuire '(A (B) (C)) 'C 'T )
; (inlocuire '(A (B (D) (C)) (C)) 'C 'T )
; (inlocuire '(A (B (E) (F) (G) (H)) (C) (D (J))) 'H 'X)
; (inlocuire '(1 (2 (5) (6)) (3 (7) (8 (9) (10) (11) (12))) (4)) '11 '24)
 


13. Definiti o functie care substituie un element prin altul la toate 
nivelurile unei liste date. 
; 13. Definiti o functie care substituie un element prin altul la toate nivelurile unei liste date.

; inlocuieste(lista-lista, element_cautat-numar, element_nou-numar)
; lista = lista in care se substituie elementele
; element_cautat = elementul care trebuie substituit
; element_nou = elementul cu care se substituie
(defun inlocuieste(lista element_cautat element_nou)
    (cond
        ((and (numberp lista) (if (= lista element_cautat) element_nou lista)))
        ((listp lista) (mapcar #'(lambda (a) (inlocuieste a element_cautat element_nou)) lista))
    )
)

(print (inlocuieste '(1 2 (1 2 (3 1) 2)) 1 0))

14. Definiti o functie care da adancimea unui arbore n-ar reprezentat sub forma 
(radacina lista_noduri_subarb1...lista_noduri_subarbn) 
Ex: adancimea arborelui este (a (b (c)) (d) (e (f))) este 3 
; 13. Define a function that returns the depth of a tree represented as (root list_of_nodes_subtree1 ...
;     list_of_nodes_subtreen)
;     Eg. the depth of the tree (a (b (c)) (d) (e (f))) is 3


; myMax(a, b) = 
; = nil, if a is not a number and b is not a number
; = a, if b is not a number
; = b, if a is not a number
; = a, if a > b
; = b, otherwise

(defun myMax(a b)
  (cond
    ((and (not (numberp a)) (not (numberp b))) nil)
    ((not (numberp b)) a)
    ((not (numberp a)) b)
    ((> a b) a)
    (t b)
  )
)


; findMax(l1l2...ln) = 
; = nil, if n = 0
; = myMax(l1, findMax(l2...ln)), otherwise

(defun findMax(l)
  (cond
    ((null l) nil)
    (t (myMax (car l) (findMax (cdr l))))
  )
)


; findDepthTree(tree, counter)
; = counter, if tree is an atom
; = findMax(findDepthTree(tree1, counter + 1), findDepth(tree2, counter + 1), ... , findDepth(treen, counter + 1)), otherwise

(defun findDepthTree(tree counter)
  (cond
    ((atom tree) counter)
    (t (apply #'findMax (list (mapcar #' (lambda (a) (findDepthTree a (+ 1 counter))) tree))))
  )
)

(defun main(l)
  (findDepthTree l 0)
)
15. Sa se construiasca o functie care intoarce numarul atomilor dintr-o 
lista, de la orice nivel.
; 14. Write a function that returns the number of atoms in a list, at any level.


; myCount(l)
; = 1, if l is an atom
; = myCount(l1) + myCount(l2) + ... + myCount(ln), where l is a list of the form l = l1l2...ln

(defun myCount (l)
  (cond
    ((atom l) 1)
    (t (apply '+ (mapcar #'myCount l)))
  )
)
16. Definiti o functie care inverseaza o lista impreuna cu toate sublistele 
sale de pe orice nivel.
; 15. Write a function that reverses a list together with all its sublists elements, at any level.

; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwisw

(defun myAppend(l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)

; myReverse(l1l2...ln) = 
; = [], if n = 0
; = myAppend(myReverse(l2...ln), list(l1)), otherwise

(defun myReverse(l)
  (cond
    ((null l) nil)
    (t (myAppend (myReverse (cdr l)) (list (car l))))
  )
)

; myReverseMC(l) = 
; = l, if l is an atom
; = myReverseMC(l1) U myReverseMC(l2) U ... U myReverseMC(ln), otherwise (l = l1l2...ln)


(defun myReverseMC(l)
  (cond
    ((atom l) l)
    (t (list (mapcar #'myReverseMC (myReverse l))))
  )
)
