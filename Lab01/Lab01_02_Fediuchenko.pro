%Завдання №1
%База даних перельотів на інші планети
%Факти

%Перельоти
%journey(код подорожі, код шатлу,код планети, код пасажира, дата подорожі)
journey(1,shutle(marko_polo,2042),planet(alko),passanger(ivan,ischenko,grygorovich),2019-11-01).
journey(2,shutle(marko_polo,2042),planet(alko),passanger(vasyl,marak,igorovich),2019-11-01).
journey(3,shutle(marko_polo,2042),planet(alko),passanger(myshko,borulya,petrovich),2019-11-01).

journey(4,shutle(voyager,2050),planet(falko),passanger(vadym,franko,ivanovich),2019-11-02).
journey(5,shutle(voyager,2050),planet(falko),passanger(olesya,karas,romanivana),2019-11-02).
journey(6,shutle(voyager,2050),planet(falko),passanger(violetta,bozhko,illyvna),2019-11-02).

journey(7,shutle(marko_polo,2042),planet(mars),passanger(vadym,franko,ivanovich),2019-11-03).
journey(8,shutle(marko_polo,2042),planet(mars),passanger(olesya,karas,romanivana),2019-11-03).
journey(9,shutle(marko_polo,2042),planet(mars),passanger(violetta,bozhko,illyvna),2019-11-03).

%Правила
%1)Назва шатлу - Sname на котрому летить пасажир з прізвищем - LastNP, у дату Date
find_transport(Sname,LastNP,Date):-journey(_,shutle(Sname,_),planet(_),passanger(_,LastNP,_),Date).

%2)Знайти назву планети - PlName  на котру полетить/полетів шатл з назвою Sname, певного дня - Date
find_planet(PlName,Sname,Date):-journey(_,shutle(Sname,_),planet(PlName),_,Date).

%3)Знайти назви кораблів - Sname, що в есплуатації вже більше певної кількості років - Years, від дати - Current_Date 
find_exploitation(Sname, Years, Current_Date):-shutle(_, Sname, ExDate), (Current_Date-ExDate)>Years.

%4)Знайти назви планет - PlName на котрих побував пасажир з прізвищем - Pname
planet_attandance(PlName, Pname):-journey(_,shutle(_,_),planet(PlName),passanger(_,Pname,_),_).

%5)Знайти прізвища усіх пасажирів - Pname, шатлу з іменем - Sname, що перевіз/перевезе хз на планету під назвою - PlName
find_passanger(Pname, Sname, PlName):-journey(_,shutle(Sname,_),planet(PlName),passanger(_,Pname,_),_).
