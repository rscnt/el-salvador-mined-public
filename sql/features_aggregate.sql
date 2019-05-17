-- Feature list: year_range,student,age_avg,age_max,age_min,student_female,grado_code_avg,grado_code_max,grado_code_min,family_members_avg,family_members_max,family_members_min,commute,commute_count,departamento,departamento_count,municipio,municipio_count,school,school_count,school_departamento,school_departamento_count,school_municipio,school_municipio_count,school_index_avg,school_index_max,school_index_min,school_difference_avg,school_difference_max,school_difference_min,school_mismatch_avg,school_mismatch_max,school_mismatch_min,school_owner_own_any,school_owner_own_all,school_owner_borrow_any,school_owner_borrow_all,school_owner_lease_any,school_owner_lease_all,school_owner_loan_any,school_owner_loan_all,school_owner_other_any,school_owner_other_all,school_native_any,school_native_all,school_electricitycompany_any,school_electricitycompany_all,school_electricity_any,school_electricity_all,school_classrooms_avg,school_classrooms_max,school_classrooms_min,school_teachers_avg,school_teachers_max,school_teachers_min,school_public_any,school_public_all,school_rural_any,school_rural_all,school_toilet_avg,school_toilet_max,school_toilet_min,school_toiletworks_avg,school_toiletworks_max,school_toiletworks_min,school_toiletpit_avg,school_toiletpit_max,school_toiletpit_min,school_toiletpitworks_avg,school_toiletpitworks_max,school_toiletpitworks_min,school_toiletseptic_avg,school_toiletseptic_max,school_toiletseptic_min,school_toiletsepticworks_avg,school_toiletsepticworks_max,school_toiletsepticworks_min,school_eight_interventions_any,school_eight_interventions_all,school_eight_program_gendered_violence_any,school_eight_program_gendered_violence_all,school_eight_program_pase_any,school_eight_program_pase_all,school_eight_program_safe_school,school_eight_program_safe_school_count,school_eight_program_safe_school_count_avg,school_eight_program_safe_school_count_max,school_eight_program_safe_school_count_min,school_eight_vaso_de_leche_any,school_eight_vaso_de_leche_all,school_eight_prostitution_any,school_eight_prostitution_all,school_eight_rape_any,school_eight_rape_all,school_eight_rape2_any,school_eight_rape2_all,school_dropout_gang_presence_any,school_dropout_gang_presence_all,school_dropout_work_any,school_dropout_work_all,school_drugs_any,school_drugs_all,school_extorsion_any,school_extorsion_all,school_sexual_exploitation_any,school_sexual_exploitation_all,school_dropout_gang_violence_any,school_dropout_gang_violence_all,school_rape_any,school_rape_all,school_dropout_sexual_violence_any,school_dropout_sexual_violence_all,school_community_gangs_any,school_community_gangs_all,school_community_trafficking_any,school_community_trafficking_all,school_dropout_pregnancy_any,school_dropout_pregnancy_all,school_dropout_migration_any,school_dropout_migration_all,school_community_rape_any,school_community_rape_all,school_community_blades_any,school_community_blades_all,school_gangs_any,school_gangs_all,school_dropout_abuse_any,school_dropout_abuse_all,school_dropout_prostitution_any,school_dropout_prostitution_all,school_community_theft_any,school_community_theft_all
set role el_salvador_mined_education_write; drop table if exists results.features_aggregate;
        create table results.features_aggregate as (
            select 
                year_range, student,
                avg(age) as age_avg, max(age) as age_max, min(age) as age_min,case when array_length(array_agg(distinct student_female), 1)=1 then (array_agg(distinct student_female))[1] else null::integer end as student_female,avg(grado_code) as grado_code_avg, max(grado_code) as grado_code_max, min(grado_code) as grado_code_min,avg(family_members) as family_members_avg, max(family_members) as family_members_max, min(family_members) as family_members_min,array_to_string(array_agg(distinct commute), ',')  as commute, array_length(array_agg(distinct commute), 1) as commute_count,array_to_string(array_agg(distinct departamento), ',')  as departamento, array_length(array_agg(distinct departamento), 1) as departamento_count,array_to_string(array_agg(distinct municipio), ',')  as municipio, array_length(array_agg(distinct municipio), 1) as municipio_count,array_to_string(array_agg(distinct school), ',')  as school, array_length(array_agg(distinct school), 1) as school_count,array_to_string(array_agg(distinct school_departamento), ',')  as school_departamento, array_length(array_agg(distinct school_departamento), 1) as school_departamento_count,array_to_string(array_agg(distinct school_municipio), ',')  as school_municipio, array_length(array_agg(distinct school_municipio), 1) as school_municipio_count,avg(school_index) as school_index_avg, max(school_index) as school_index_max, min(school_index) as school_index_min,avg(school_difference) as school_difference_avg, max(school_difference) as school_difference_max, min(school_difference) as school_difference_min,avg(school_mismatch) as school_mismatch_avg, max(school_mismatch) as school_mismatch_max, min(school_mismatch) as school_mismatch_min,bool_or(school_owner_own) as school_owner_own_any, bool_and(school_owner_own) as school_owner_own_all,bool_or(school_owner_borrow) as school_owner_borrow_any, bool_and(school_owner_borrow) as school_owner_borrow_all,bool_or(school_owner_lease) as school_owner_lease_any, bool_and(school_owner_lease) as school_owner_lease_all,bool_or(school_owner_loan) as school_owner_loan_any, bool_and(school_owner_loan) as school_owner_loan_all,bool_or(school_owner_other) as school_owner_other_any, bool_and(school_owner_other) as school_owner_other_all,bool_or(school_native) as school_native_any, bool_and(school_native) as school_native_all,bool_or(school_electricitycompany) as school_electricitycompany_any, bool_and(school_electricitycompany) as school_electricitycompany_all,bool_or(school_electricity) as school_electricity_any, bool_and(school_electricity) as school_electricity_all,avg(school_classrooms) as school_classrooms_avg, max(school_classrooms) as school_classrooms_max, min(school_classrooms) as school_classrooms_min,avg(school_teachers) as school_teachers_avg, max(school_teachers) as school_teachers_max, min(school_teachers) as school_teachers_min,bool_or(school_public) as school_public_any, bool_and(school_public) as school_public_all,bool_or(school_rural) as school_rural_any, bool_and(school_rural) as school_rural_all,avg(school_toilet) as school_toilet_avg, max(school_toilet) as school_toilet_max, min(school_toilet) as school_toilet_min,avg(school_toiletworks) as school_toiletworks_avg, max(school_toiletworks) as school_toiletworks_max, min(school_toiletworks) as school_toiletworks_min,avg(school_toiletpit) as school_toiletpit_avg, max(school_toiletpit) as school_toiletpit_max, min(school_toiletpit) as school_toiletpit_min,avg(school_toiletpitworks) as school_toiletpitworks_avg, max(school_toiletpitworks) as school_toiletpitworks_max, min(school_toiletpitworks) as school_toiletpitworks_min,avg(school_toiletseptic) as school_toiletseptic_avg, max(school_toiletseptic) as school_toiletseptic_max, min(school_toiletseptic) as school_toiletseptic_min,avg(school_toiletsepticworks) as school_toiletsepticworks_avg, max(school_toiletsepticworks) as school_toiletsepticworks_max, min(school_toiletsepticworks) as school_toiletsepticworks_min,bool_or(school_eight_interventions) as school_eight_interventions_any, bool_and(school_eight_interventions) as school_eight_interventions_all,bool_or(school_eight_program_gendered_violence) as school_eight_program_gendered_violence_any, bool_and(school_eight_program_gendered_violence) as school_eight_program_gendered_violence_all,bool_or(school_eight_program_pase) as school_eight_program_pase_any, bool_and(school_eight_program_pase) as school_eight_program_pase_all,array_to_string(array_agg(distinct school_eight_program_safe_school), ',')  as school_eight_program_safe_school, array_length(array_agg(distinct school_eight_program_safe_school), 1) as school_eight_program_safe_school_count,avg(school_eight_program_safe_school_count) as school_eight_program_safe_school_count_avg, max(school_eight_program_safe_school_count) as school_eight_program_safe_school_count_max, min(school_eight_program_safe_school_count) as school_eight_program_safe_school_count_min,bool_or(school_eight_vaso_de_leche) as school_eight_vaso_de_leche_any, bool_and(school_eight_vaso_de_leche) as school_eight_vaso_de_leche_all,bool_or(school_eight_prostitution) as school_eight_prostitution_any, bool_and(school_eight_prostitution) as school_eight_prostitution_all,bool_or(school_eight_rape) as school_eight_rape_any, bool_and(school_eight_rape) as school_eight_rape_all,bool_or(school_eight_rape2) as school_eight_rape2_any, bool_and(school_eight_rape2) as school_eight_rape2_all,bool_or(school_dropout_gang_presence) as school_dropout_gang_presence_any, bool_and(school_dropout_gang_presence) as school_dropout_gang_presence_all,bool_or(school_dropout_work) as school_dropout_work_any, bool_and(school_dropout_work) as school_dropout_work_all,bool_or(school_drugs) as school_drugs_any, bool_and(school_drugs) as school_drugs_all,bool_or(school_extorsion) as school_extorsion_any, bool_and(school_extorsion) as school_extorsion_all,bool_or(school_sexual_exploitation) as school_sexual_exploitation_any, bool_and(school_sexual_exploitation) as school_sexual_exploitation_all,bool_or(school_dropout_gang_violence) as school_dropout_gang_violence_any, bool_and(school_dropout_gang_violence) as school_dropout_gang_violence_all,bool_or(school_rape) as school_rape_any, bool_and(school_rape) as school_rape_all,bool_or(school_dropout_sexual_violence) as school_dropout_sexual_violence_any, bool_and(school_dropout_sexual_violence) as school_dropout_sexual_violence_all,bool_or(school_community_gangs) as school_community_gangs_any, bool_and(school_community_gangs) as school_community_gangs_all,bool_or(school_community_trafficking) as school_community_trafficking_any, bool_and(school_community_trafficking) as school_community_trafficking_all,bool_or(school_dropout_pregnancy) as school_dropout_pregnancy_any, bool_and(school_dropout_pregnancy) as school_dropout_pregnancy_all,bool_or(school_dropout_migration) as school_dropout_migration_any, bool_and(school_dropout_migration) as school_dropout_migration_all,bool_or(school_community_rape) as school_community_rape_any, bool_and(school_community_rape) as school_community_rape_all,bool_or(school_community_blades) as school_community_blades_any, bool_and(school_community_blades) as school_community_blades_all,bool_or(school_gangs) as school_gangs_any, bool_and(school_gangs) as school_gangs_all,bool_or(school_dropout_abuse) as school_dropout_abuse_any, bool_and(school_dropout_abuse) as school_dropout_abuse_all,bool_or(school_dropout_prostitution) as school_dropout_prostitution_any, bool_and(school_dropout_prostitution) as school_dropout_prostitution_all,bool_or(school_community_theft) as school_community_theft_any, bool_and(school_community_theft) as school_community_theft_all from results.features_raw group by year_range, student); create index aggregate_year_range_student_idx on results.features_aggregate(year_range, student);