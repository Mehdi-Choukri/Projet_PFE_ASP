create database Avion_Reservation

use Avion_Reservation
/*CustomerDetails*/ 
drop table Client
create table Client ( ClientID int IDENTITY(1,1) PRIMARY KEY,
						      C_Nom varchar(50) not null,
                              C_User Varchar(50)not null Unique, 
                              C_Mail varchar(50) null,
                              C_Pass varchar(50) not null ,
                              C_DateNaissance  Datetime not null,
                              C_Address  varchar(200)null,
                              C_Phone BigInt null,
                              C_Sexe varchar(50) null,                             
                              C_CIN varchar (50) not null,
                              Portfeille  Money ,
							  Date_Creation datetime default CURRENT_TIMESTAMP 
							  
							  ); 
							  
							  insert into Client values ('Choukri','Admin','Mehdi@gmail.com','Admin','02/26/1995','173 Safi II ','0614075409','Masculin','HH112313',1000,'')                                                        
							  update Client Set C_Sexe='Mâle' where ClientID=2

ALTER TABLE Client ADD CONSTRAINT DC DEFAULT GETDATE() FOR Date_Creation

 
/*Le User doit etre unique pour que ce dernier puisse s'authentifier  */
alter table Client add constraint C_User_Unique unique(C_User);

select  C_Pass from Client where C_User='Choukri'
select * from Reservation

update Client set Portfeille = 4000 where ClientID=3







delete from Client where ClientID=111007









SELECT SERVERPROPERTY('COLLATION')


--------------------------------------/*   TABLE  Ville location */---------------------------------------------------------------------------- */


create table Ville
(
ID int primary key,
Ville_nom varchar(50),
)


insert into Villes values(10,'Rabat')
insert into Villes values(11,'Marrakech')
insert into Villes values(12,'Paris')
insert into Villes values(13,'Madrid')
insert into Villes values(14,'Cairo')
insert into Villes values(15,'Berlin')
insert into Villes values(16,'Washinton')
insert into Villes values(17,'NYC')
insert into Villes values(18,'Moscco')
insert into Villes values(19,'Brazilia')
insert into Villes values(20,'Argentina')
insert into Villes values(21,'LasVegas')

drop table Villes

select * from Villes;


create table Location_Villes(ID int primary key,
                             Depart_ville varchar(50),
                             Arrive_ville varchar(50));


insert into Location_Villes values(10,'Paris','Paris')
insert into Location_Villes values (11,'Rabat','Rabat')
insert into Location_Villes values(12,'Delhi','Delhi')
Update Location_Villes set Arrive_ville='Frankfourt' , Depart_ville='Frankfourt' where ID=12
insert into Location_Villes values(13,'Berlin','Berlin')
insert into Location_Villes values(14,'Marrakech','Marrakech')
insert into Location_Villes values(15,'Cairo','Cairo')
insert into Location_Villes values(16,'Washinton','Washinton')
insert into Location_Villes values (17,'Madrid','Madrid')
insert into Location_Villes values(18,'Rome','Rome')
insert into Location_Villes values(19,'Moscco','Moscco')
insert into Location_Villes values(20,'Argentina','Argentina')
insert into Location_Villes values(21,'Brazilia','Brazilia')
insert into Location_Villes values(22,'Tunisie','Tunisie')
								  

-------------------------------------------------/*    TABLE de Compagnie airienne */--------------------------------------------------------------


create table Compagnie(Com_ID int primary key,
                            Com_Name varchar(50));


insert into Compagnie values(100,'AirGo')
insert into Compagnie values (101,'IndiGO')
insert into Compagnie values(102,'SpiceJet')
insert into Compagnie values(103,'Kingfisher')
insert into Compagnie values(104,'ARAM')
insert into Compagnie values(105,'Boeing')
insert into Compagnie values(106,'Airbus')							


select * from Compagnie;





--------------------------------------/*  TABLE De Vol */---------------------------------------------------------------------------- */

drop table Vol 
create table Vol(Vol_ID varchar(20) primary key,
						   Compagnie_ID int foreign key references Compagnie(Com_ID) on delete cascade,
                           Depart_Date date,
                           Depart_Time time,
                           Arrival_Time time,
						   DepartLoc_ID int foreign key references Villes(ID)  ,
                           ArriveLoc_ID int foreign key references Villes(ID)  ,
                           Siege_disponible int,
                           PrixHT float);


insert into Vol values('A_000',100,'2017-04-26','09:20','12:45',10,11,45,6200);


exec Recherche_Vol_SP 'Paris','Rabat','2017-04-26','09:20',1;

insert into Vol values('AIR_200',	100,	'01-03-2018',   '09:20:00',	'12:45:00',	12,	14,	40,	4500);
insert into Vol values('AIR_001',	100,	'01-03-2018',	'09:20:00',	'12:45:00',	14,	12,	40,	4500);
insert into Vol values('AIR_145',	100,	'01-03-2018',	'10:00:00',	'11:00:00',	12,	14,	42,	3500);
insert into Vol values('AIR_148', 100,	'01-03-2018',   '10:00:00',	'11:00:00',	14,	12,	16,	3500);
insert into Vol values('IND_58',	101,	'01-03-2018',   '11:00:00',	'13:00:00',	12,	14,	15,	4852);
insert into Vol values('IND_59',	101,	'01-03-2018',	'11:00:00',	'13:00:00',	14,	12,	15,	4852);
insert into Vol values('JET_851',	106,	'01-03-2018',	'16:00:00',	'19:00:00',	14,	12,	36,	2300);
insert into Vol values('JET_852',	106,	'01-03-2018',	'16:00:00',	'19:00:00',	11,	14,	36,	2300);
insert into Vol values('KING_103',103,	'01-03-2018',	'15:00:00',	'18:00:00',	12,	14,	17,	1400);
insert into Vol values('KING_105',103,	'01-03-2018',	'15:00:00',	'18:00:00',	14,	12,	17,	1400);
insert into Vol values('SPJ_784',	102,    '01-03-2018',	'04:00:00',	'07:00:00',	14,	12, 19,	920);
insert into Vol values('SPJ_785',	102,	'01-03-2018',	'04:00:00',	'07:00:00',	12,	14,	19,	920);

select Vol.* from Vol , Villes where ID=DepartLoc_ID and Ville_nom='Paris'

select * from Vol;

update Vol set DepartLoc_ID=18 , ArriveLoc_ID=16 where Vol_ID='AIR_200'
update Vol set DepartLoc_ID=13 , ArriveLoc_ID=17 where Vol_ID='AIR_001'
update Vol set DepartLoc_ID=17 , ArriveLoc_ID=18 where Vol_ID='IND_59'

update Vol set DepartLoc_ID=10 , ArriveLoc_ID=15 where Vol_ID='JET_851'
update Vol set DepartLoc_ID=20 , ArriveLoc_ID=21 where Vol_ID='KING_103'
update Vol set DepartLoc_ID=19 , ArriveLoc_ID=17 where Vol_ID='KING_105'


drop table Vol



--------------------------------------/*   Table d'annulation */----------------------------------------------------------------------------*/

create table Annuler_Ticket(
 Ticket_ID  int  identity(1,1) primary key,
Reservation_ID bigint foreign key references Reservation (Reservation_ID) ,
Name varchar(50)) 


select * from Annuler_Ticket;

drop table Annuler_Ticket



---------------------------------------/* reservation Table */----------------------------------------------------------------------------

drop table Reservation 
create table Reservation ( Reservation_ID bigint identity(1,1) primary key,
                           Client_ID int foreign key references Client (ClientID) on delete Cascade ,
                           Client_Name varchar(50),
                           Date_Aujourdhui Date,
						   Vol_ID varchar(20) foreign key references Vol (Vol_ID) on delete Cascade,
                           Com_Name varchar(50),
                           Source_Loc varchar(50),
                           Destination_Loc varchar(50),
                           Nbr_Place int ,
                           Date_Reservation date,
                           Depart_Time time,
                           PHT float,
                           Total_PHT float,
                           Status_Reservation varchar(50))
                     
                   ALTER TABLE Reservation
  ALTER COLUMN Total_PHT float;

select * from  Reservation



--------------------------------------/* Inscription Page */----------------------------------------------------------------------------



create procedure Insertion_Client_SP 
@CNom Varchar(50), 
@Cuser Varchar(50),
@CMail varchar(50),
@CPass varchar(50),
@CDOB  date,
 @CAddress  varchar(200),
@CPhone BigInt,
@CSexe varchar(50),                                         
@CCIN varchar (50) ,
@CMontant float ,
@DC date
as
begin 
insert into Client
values (@CNom, @Cuser,@CMail, @CPass,@CDOB, @CAddress, @CPhone,  @CSexe,  @CCIN ,@CMontant,@DC)
                           

end            
         
         select * from Reservation

		 insert into Reservation  values (  3 ,'Choukri','' ,'A_000' ,'AirGo','Paris' ,'Rabat' ,  1 ,'10-02-2019' ,'2017-04-26' ,6200 ,6200*2,'1')
select Reservation_ID from   Reservation  where Client_ID=@Client_ID   


declare @Booking_ID bigint
exec Confirm_Reservation_SP 3,'Choukri','11-04-2017','A_000','AirGo','Rabat','Paris',1,'06-06-2019','09:20',6200,'Reservée',@Booking_ID out
print @Booking_id



---------------------------------------------------/* Booking Confirm Page Confirmation */----------------------------------------------------------------------------

drop proc Confirm_Reservation_SP

create proc Confirm_Reservation_SP @Client_ID int,
                                 @Client_Name varchar(50),
							     @Date_Aujourdhui date,
							     @Vol_ID varchar(50),
                                 @Com_Name varchar(50),
							     @Source_Loc varchar(50),
							     @Destination_Loc varchar(50),
							     @Nbr_Place int ,
                                @Date_Reservation varchar(50),
                                 @Depart_Time time,
                                 @PHT float,
                                 
								 @Status_Reservation varchar(50),
                                 @Status_R int output
as
begin
set @Status_Reservation='Reservé'

declare @Montant float 
declare @TEST float 


Set @Montant= @PHT *@Nbr_Place 

set @TEST= (select Portfeille from Client where ClientID=@Client_ID )
if(@TEST>@Montant)
begin
insert into Reservation  values (  @Client_ID ,@Client_Name,@Date_Aujourdhui ,@Vol_ID ,@Com_Name,@Source_Loc ,@Destination_Loc ,  @Nbr_Place ,@Date_Reservation ,@Depart_Time ,@PHT ,@Montant,@Status_Reservation)

   
update Client  set  Portfeille =  Portfeille - @Montant  where ClientID=@Client_ID    
 
update Vol set Siege_disponible  = Siege_disponible-@Nbr_Place where Vol_ID = @Vol_ID

set @Status_R=1
end
else
begin
set @Status_R=-1

end  
end


 
---------------------------------------------------/*  Page d'annulation */----------------------------------------------------------------------------


create proc Annuler_Reservation_SP  @Reservation_ID int ,
                          @Status int output,
                          @Montant_Annuler float output,
                          @ClientID int
                       

as
begin

declare @Check int =0 ;
select @Check=count(*) from Reservation where Client_ID=@ClientID and
                                              Reservation_ID =@Reservation_ID and
                                              Status_Reservation='Reservé'

declare @Diff int=0;
declare @Date_Aujourdhui date
set @Date_Aujourdhui=(select Date_Aujourdhui from Reservation where Reservation_ID =@Reservation_ID  )
select  @Diff = DATEDIFF(DAY,GETDATE(),@Date_Aujourdhui),
         @Montant_Annuler= Total_PHT from Reservation where Reservation_ID =@Reservation_ID and @Check=1;
        
		/*Faire perde du temps pour une agence  ne passera pas sans payer le prix */
             if(@Diff>=10 and @check=1 )
                set  @Montant_Annuler=@Montant_Annuler-@Montant_Annuler*10/100;
                
			 else if (@Diff>5 and @Diff<10 and @check=1)
                set @Montant_Annuler=@Montant_Annuler-@Montant_Annuler*20/100;
                
             else if (@Diff>=1 and @Diff<=5 and @check=1)
                set @Montant_Annuler=@Montant_Annuler-@Montant_Annuler*50/100;
             


set @Status =0
declare @St1 int=0
select @St1=COUNT(*) from  Reservation where Reservation_ID =@Reservation_ID and Status_Reservation !='Annuler'

              if(@St1=1)
                  set @Status=1
              else
                  set @Status=0 

              if(@St1=1)
                 set @status=1
              else
                 set @Montant_Annuler=0

update Client
set  Portfeille =  Portfeille + @Montant_Annuler  where ClientID=@ClientID 

update Reservation
set  Status_Reservation =  'Annuler'  where Client_ID=@ClientID  and Reservation_ID =@Reservation_ID

declare @VOL_ID varchar(50)

select @VOL_ID =Vol_ID from Reservation where Reservation_ID =@Reservation_ID
declare @nbr int 
set @nbr = (select Nbr_Place from Reservation where Reservation_ID =@Reservation_ID)
update Vol set Siege_disponible = Siege_disponible + @nbr where Vol_ID = @VOL_ID

end





---------------------------------------------------/* Recuperation de donnée  */----------------------------------------------------------------------------



create procedure CustomerDetailsFetch_SP @Cus_User_Name varchar(50),
                                        @Cus_ID bigint output,
                                        @Cus_Mail varchar(50) output,
                                        @Cus_DOB varchar(50)output,
                                        @Cus_Address varchar(50)output,
                                        @Cus_Phone varchar(50)output,
                                        @Cus_Gender varchar(50)output,
                                        @Bal_Amount money output
                           
                           
                             
as
begin 
select @Cus_ID = CustomerID ,
       @Cus_Mail =C_Mail,
       @Cus_DOB = C_DOB,
       @Cus_Address = C_Address,
       @Cus_Phone =C_Phone,
       @Cus_Gender =C_Geneder,
       @Bal_Amount = PrepaidWallet from  CustomerDetails where C_User_Name=@Cus_User_Name
                          
end  

select * from CustomerDetails
declare @cusID bigint  
exec CustomerDetailsFetch_SP 'Santhosh', @cusID output
print @cusID

drop proc CustomerDetailsFetch_SP

---------------------------------------------------/* Portefeuille */----------------------------------------------------------------------------
select * from Client

create proc Portfeille_SP @Name varchar(50),
                          @Balance float output

as
begin
select    @Balance=Portfeille from Client where C_User=@name
end





declare @bal float
exec Portfeille_SP 'Admin', @bal out
print @bal

---------------------------------------------------/*Recherche des vols */----------------------------------------------------------------------------
drop procedure  Recherche_Vol_SP 

CREATE procedure Recherche_Vol_SP    @P_ville_depart varchar(50),
							        @P_ville_Arriver varchar(50),
								    @p_Date_depart varchar(50),
								    @p_Heure_depart varchar(50),
								    @P_Siege int
as
begin


select V.Vol_ID,
       C.Com_Name,
	   V.Depart_Date,
       loc1.Depart_ville,
       V.Depart_Time,
       loc2.Arrive_ville,
       V.Arrival_Time,
       V.PrixHT            from Vol V 
						      join Compagnie C on C.Com_ID=V.Compagnie_ID

						      join Location_Villes loc1 on loc1.id= V.DepartLoc_ID
				              join Location_Villes loc2 on loc2.id=V.ArriveLoc_ID

							  
    
                                                                             where loc1.Depart_ville = @P_ville_depart and 
                                                                                   loc2.Arrive_ville = @P_ville_Arriver and 
                                                                                   V.Depart_Date = @p_Date_depart and
                                                                                   V.Depart_time >= @p_Heure_depart and 
                                                                                   V.Siege_disponible >= @P_Siege            order by  V.Depart_Time

end


drop proc Search_Flight_SP



select * from Flight_Master;

delete from Flight_Master where Flight_ID ='A_000'
---------------------------------------/* Changement du mot de passe */--------------------------------------------------------------------------------------------




create procedure CustomerPasswordUpdate_SP @C_Old_Pass Varchar(50),
                                          @C_New_Passs varchar(50),
                                          @Cus_ID varchar(50),
                                          @Status int output
                             
as
begin 
declare @Check int = 0;

update  CustomerDetails   set C_Pass=@C_New_Passs  where @Cus_ID=CustomerID and 
                                                         @C_Old_Pass COLLATE Latin1_General_CS_AS =C_Pass;


select @Check=COUNT(*) from  CustomerDetails where C_Pass COLLATE Latin1_General_CS_AS  =@C_New_Passs

        if(@Check=1)
          set @Status=1
        else
          set @Status=0
end          


select * from CustomerDetails

declare @st int =0;
exec CustomerPasswordUpdate  'Hello', 'Hi', '111000', @st out
print @st

drop proc CustomerPasswordUpdate_SP


--------------------------------------------------------/* Trips Page */-------------------------------------------------------------------

create proc BookingHistory_SP @CusID varchar(50)                           
                           
as
begin
select Booking_ID,      
	   CusName ,
	   Date_Of_journey ,
       AirlineName  ,
	   Source_Loc  ,
	   Destination_Loc,
	   Pass_Count ,
       Book_Date  ,
       Depart_Time  ,      
       Tot_fare,
       StatusOfBooking from BookDetails where CusID=@CusID order by Book_Date desc
                              
 
end  

select * from BookDetails

drop proc BookingHistory_SP

----------------------------------------/* Forgot Password */ --------------------------------------------------------------------


create proc ForgotPassword_SP @SSN_Type varchar(50),
                              @SS_Number varchar(50),
                              @Confirm_Pass varchar(50),
                              @Status int out
as
begin

declare @St int =0
update CustomerDetails 

set C_Pass = @Confirm_Pass where C_SSNType =@SSN_Type and C_SSN = @SS_Number 

select @St=COUNT(*) from CustomerDetails where  C_SSNType =@SSN_Type and C_SSN = @SS_Number 

if(@St!=0)
  set @Status =1
else
  set @Status =0

end


------------------------------------Reservation Confirmation requette "-------------------------------------------

select V.Vol_ID,
       C.Com_Name,
	   V.Depart_Date,
       loc1.Depart_ville,
       V.Depart_Time,
       loc2.Arrive_ville,
       V.Arrival_Time,
       V.PrixHT            from Vol V 
						      join Compagnie C on C.Com_ID=V.Compagnie_ID

						      join Location_Villes loc1 on loc1.id= V.DepartLoc_ID
				              join Location_Villes loc2 on loc2.id=V.ArriveLoc_ID

							  where V.Vol_ID='A_000'