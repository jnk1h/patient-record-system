PGDMP  !    :                }         
   Healthcare    17.4    17.4 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24641 
   Healthcare    DATABASE     r   CREATE DATABASE "Healthcare" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE "Healthcare";
                     postgres    false            �            1259    24662    appointment    TABLE     �   CREATE TABLE public.appointment (
    appointmentid integer NOT NULL,
    patientid integer,
    doctorid integer,
    date date
);
    DROP TABLE public.appointment;
       public         heap r       postgres    false            �            1259    24704    billing    TABLE     n   CREATE TABLE public.billing (
    billid integer NOT NULL,
    patientid integer,
    amount numeric(10,2)
);
    DROP TABLE public.billing;
       public         heap r       postgres    false            �            1259    24652 
   department    TABLE     �   CREATE TABLE public.department (
    departmentid integer NOT NULL,
    name character varying(100),
    location character varying(100)
);
    DROP TABLE public.department;
       public         heap r       postgres    false            �            1259    24647    doctor    TABLE     �   CREATE TABLE public.doctor (
    doctorid integer NOT NULL,
    name character varying(100),
    speciality character varying(100),
    departmentid integer
);
    DROP TABLE public.doctor;
       public         heap r       postgres    false            �            1259    24677    medicalrecord    TABLE     �   CREATE TABLE public.medicalrecord (
    recordid integer NOT NULL,
    patientid integer,
    doctorid integer,
    diagnosis text
);
 !   DROP TABLE public.medicalrecord;
       public         heap r       postgres    false            �            1259    24642    patient    TABLE     �   CREATE TABLE public.patient (
    patientid integer NOT NULL,
    name character varying(100),
    dob date,
    gender character(1)
);
    DROP TABLE public.patient;
       public         heap r       postgres    false            �            1259    24714    patientphone    TABLE     u   CREATE TABLE public.patientphone (
    patientid integer NOT NULL,
    phonenumber character varying(15) NOT NULL
);
     DROP TABLE public.patientphone;
       public         heap r       postgres    false            �            1259    24694    prescription    TABLE     �   CREATE TABLE public.prescription (
    prescriptionid integer NOT NULL,
    recordid integer,
    medicationname character varying(100)
);
     DROP TABLE public.prescription;
       public         heap r       postgres    false            �          0    24662    appointment 
   TABLE DATA           O   COPY public.appointment (appointmentid, patientid, doctorid, date) FROM stdin;
    public               postgres    false    220   +       �          0    24704    billing 
   TABLE DATA           <   COPY public.billing (billid, patientid, amount) FROM stdin;
    public               postgres    false    223   3+       �          0    24652 
   department 
   TABLE DATA           B   COPY public.department (departmentid, name, location) FROM stdin;
    public               postgres    false    219   P+       �          0    24647    doctor 
   TABLE DATA           J   COPY public.doctor (doctorid, name, speciality, departmentid) FROM stdin;
    public               postgres    false    218   m+       �          0    24677    medicalrecord 
   TABLE DATA           Q   COPY public.medicalrecord (recordid, patientid, doctorid, diagnosis) FROM stdin;
    public               postgres    false    221   �+       �          0    24642    patient 
   TABLE DATA           ?   COPY public.patient (patientid, name, dob, gender) FROM stdin;
    public               postgres    false    217   �+       �          0    24714    patientphone 
   TABLE DATA           >   COPY public.patientphone (patientid, phonenumber) FROM stdin;
    public               postgres    false    224   �+       �          0    24694    prescription 
   TABLE DATA           P   COPY public.prescription (prescriptionid, recordid, medicationname) FROM stdin;
    public               postgres    false    222   �+       C           2606    24666    appointment appointment_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (appointmentid);
 F   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_pkey;
       public                 postgres    false    220            I           2606    24708    billing billing_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_pkey PRIMARY KEY (billid);
 >   ALTER TABLE ONLY public.billing DROP CONSTRAINT billing_pkey;
       public                 postgres    false    223            A           2606    24656    department department_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (departmentid);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public                 postgres    false    219            ?           2606    24651    doctor doctor_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (doctorid);
 <   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_pkey;
       public                 postgres    false    218            E           2606    24683     medicalrecord medicalrecord_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.medicalrecord
    ADD CONSTRAINT medicalrecord_pkey PRIMARY KEY (recordid);
 J   ALTER TABLE ONLY public.medicalrecord DROP CONSTRAINT medicalrecord_pkey;
       public                 postgres    false    221            =           2606    24646    patient patient_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patientid);
 >   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_pkey;
       public                 postgres    false    217            K           2606    24718    patientphone patientphone_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.patientphone
    ADD CONSTRAINT patientphone_pkey PRIMARY KEY (patientid, phonenumber);
 H   ALTER TABLE ONLY public.patientphone DROP CONSTRAINT patientphone_pkey;
       public                 postgres    false    224    224            G           2606    24698    prescription prescription_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT prescription_pkey PRIMARY KEY (prescriptionid);
 H   ALTER TABLE ONLY public.prescription DROP CONSTRAINT prescription_pkey;
       public                 postgres    false    222            M           2606    24672 %   appointment appointment_doctorid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_doctorid_fkey FOREIGN KEY (doctorid) REFERENCES public.doctor(doctorid);
 O   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_doctorid_fkey;
       public               postgres    false    218    220    4671            N           2606    24667 &   appointment appointment_patientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_patientid_fkey FOREIGN KEY (patientid) REFERENCES public.patient(patientid);
 P   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_patientid_fkey;
       public               postgres    false    4669    217    220            R           2606    24709    billing billing_patientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_patientid_fkey FOREIGN KEY (patientid) REFERENCES public.patient(patientid);
 H   ALTER TABLE ONLY public.billing DROP CONSTRAINT billing_patientid_fkey;
       public               postgres    false    223    217    4669            L           2606    24657    doctor doctor_departmentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_departmentid_fkey FOREIGN KEY (departmentid) REFERENCES public.department(departmentid);
 I   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_departmentid_fkey;
       public               postgres    false    4673    218    219            O           2606    24689 )   medicalrecord medicalrecord_doctorid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicalrecord
    ADD CONSTRAINT medicalrecord_doctorid_fkey FOREIGN KEY (doctorid) REFERENCES public.doctor(doctorid);
 S   ALTER TABLE ONLY public.medicalrecord DROP CONSTRAINT medicalrecord_doctorid_fkey;
       public               postgres    false    218    4671    221            P           2606    24684 *   medicalrecord medicalrecord_patientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicalrecord
    ADD CONSTRAINT medicalrecord_patientid_fkey FOREIGN KEY (patientid) REFERENCES public.patient(patientid);
 T   ALTER TABLE ONLY public.medicalrecord DROP CONSTRAINT medicalrecord_patientid_fkey;
       public               postgres    false    221    4669    217            S           2606    24719 (   patientphone patientphone_patientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patientphone
    ADD CONSTRAINT patientphone_patientid_fkey FOREIGN KEY (patientid) REFERENCES public.patient(patientid);
 R   ALTER TABLE ONLY public.patientphone DROP CONSTRAINT patientphone_patientid_fkey;
       public               postgres    false    224    217    4669            Q           2606    24699 '   prescription prescription_recordid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT prescription_recordid_fkey FOREIGN KEY (recordid) REFERENCES public.medicalrecord(recordid);
 Q   ALTER TABLE ONLY public.prescription DROP CONSTRAINT prescription_recordid_fkey;
       public               postgres    false    221    4677    222            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     