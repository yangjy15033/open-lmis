-- Copyright © 2013 VillageReach.  All Rights Reserved.  This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
-- If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

INSERT INTO requisition_groups ( code ,name,description,supervisoryNodeId )values
('RG2','Requistion Group 2','Supports EM(Q1M)',(select id from  supervisory_nodes where code ='N1')),
('RG1','Requistion Group 1','Supports EM(Q2M)',(select id from  supervisory_nodes where code ='N2')),
('RG3','Requistion Group 3','Supports EM(Q2M)',(select id from  supervisory_nodes where code ='N2')),
('RG4','Requistion Group 4','Supports EM(Q2M)',(select id from  supervisory_nodes where code ='N3'));

INSERT INTO requisition_group_members ( requisitionGroupId ,facilityId )values
((select id from  requisition_groups where code ='RG1'),(select id from  facilities where code ='F10')),
((select id from  requisition_groups where code ='RG2'),(select id from  facilities where code ='F11')),
((select id from  requisition_groups where code ='RG3'),(select id from  facilities where code ='F13')),
((select id from  requisition_groups where code ='RG4'),(select id from  facilities where code ='F100'));


insert into requisition_group_program_schedules ( requisitionGroupId , programId , scheduleId , directDelivery ) values
((select id from requisition_groups where code='RG1'),(select id from programs where code='ESS_MEDS'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG1'),(select id from programs where code='MALARIA'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG1'),(select id from programs where code='HIV'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG1'),(select id from programs where code='TB'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG2'),(select id from programs where code='ESS_MEDS'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG2'),(select id from programs where code='MALARIA'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG2'),(select id from programs where code='HIV'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG2'),(select id from programs where code='TB'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG3'),(select id from programs where code='HIV'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG3'),(select id from programs where code='TB'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG4'),(select id from programs where code='TB'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG4'),(select id from programs where code='ESS_MEDS'),(select id from processing_schedules where code='M'),TRUE),
((select id from requisition_groups where code='RG4'),(select id from programs where code='MALARIA'),(select id from processing_schedules where code='M'),TRUE);


insert into supply_lines (description, supervisoryNodeId, programId, supplyingFacilityId,exportOrders) values
('supplying node for MALARIA', (select id from supervisory_nodes where code = 'N1'), (select id from programs where code='MALARIA'),(select id from facilities where code = 'F10'),'t'),
('supplying node for TB', (select id from supervisory_nodes where code = 'N1'), (select id from programs where code='TB'),(select id from facilities where code = 'F10'),'t'),
('supplying node for TB', (select id from supervisory_nodes where code = 'N3'), (select id from programs where code='ESS_MEDS'),(select id from facilities where code = 'F11'),'t'),
('supplying node for TB', (select id from supervisory_nodes where code = 'N3'), (select id from programs where code='MALARIA'),(select id from facilities where code = 'F11'),'f');

