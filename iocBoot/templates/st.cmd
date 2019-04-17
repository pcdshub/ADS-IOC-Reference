#!$$IOCTOP/bin/rhel7-x86_64/ads
require ads

epicsEnvSet("IOCNAME", "$$IOCNAME" )
epicsEnvSet("ENGINEER", "$$ENGINEER" )
epicsEnvSet("LOCATION", "$$LOCATION" )
epicsEnvSet("IOCSH_PS1", "$(IOCNAME)> " )
epicsEnvSet("IOC_PV", "$$IOC_PV")
epicsEnvSet("IOCTOP", "$$IOCTOP")
< envPaths
epicsEnvSet("TOP", "$$TOP")
cd( "$(IOCTOP)" )

# Run common startup commands for linux soft IOC's
< /reg/d/iocCommon/All/pre_linux.cmd

# Register all support components
dbLoadDatabase("dbd/ads.dbd")
ads_registerRecordDeviceDriver(pdbbase)

## LOAD STUFF HERE!!!  DRIVERS FIRST, THEN RECORDS!
#plc-tst-cx2020
adsAsynPortDriverConfigure("ADS_1","172.21.42.215","5.45.6.154.1.1",851,1000, 0, 0, 500, 1000, 1000, 0)
#plc-tst-proto4:
#adsAsynPortDriverConfigure("ADS_1","172.21.42.90","5.54.18.118.1.1",851,1000, 0, 0, 500, 1000, 1000, 0)
asynSetTraceMask("ADS_1", -1, 0x41)
asynSetTraceIOMask("ADS_1", -1, 6)
asynSetTraceInfoMask("ADS_1", -1, 15)
dbLoadRecords("db/adsTest.db","P=ADS_IOC:ASYN:,PORT=ADS_1")

dbLoadRecords("db/iocSoft.db", "IOC=$(IOC_PV)")
dbLoadRecords("db/save_restoreStatus.db", "IOC=$(IOC_PV)")

# Setup autosave
set_savefile_path( "$(IOC_DATA)/$(IOC)/autosave" )
set_requestfile_path( "$(TOP)/autosave" )
save_restoreSet_status_prefix( "$(IOC_PV):" )
save_restoreSet_IncompleteSetsOk( 1 )
save_restoreSet_DatedBackupFiles( 1 )
set_pass0_restoreFile( "$(IOCNAME).sav" )
set_pass1_restoreFile( "$(IOCNAME).sav" )

# Initialize the IOC and start processing records
iocInit()

# Start autosave backups
create_monitor_set( "$(IOCNAME).req", 5, "IOC=$(IOC_PV)" )

# All IOCs should dump some common info after initial startup.
< /reg/d/iocCommon/All/post_linux.cmd
