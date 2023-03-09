# ** This repository has been archived; see https://github.com/pcdshub/ads-ioc/ **

# ADS IOC Reference 

This repository is for documenting the acceptable records to be used with the ADS IOC. This repository comes packaged with an IOC and TwinCAT3 project and should work out-of-the-box. 

It should be kept closely aligned with [ADS-IOC-Example](https://github.com/pcdshub/ADS-IOC-Example)

All IOC adoption work was completed by mcbrowne and the [ESS](https://europeanspallationsource.se/). 

## Configuring the IOC

You can edit the IOC's basic configuration options here: `iocBoot/templates/st.cmd`.
The following terms in `[BRACKETS]` with the information about the PLC your IOC is communicating with. 
`adsAsynPortDriverConfigure("ADS_1","[IP_ADDRESS]","[AMS_NET_ID]",851,1000, 0, 0, 500, 1000, 1000, 0)`

## Editing the records

Edit `adsApp/Db/adsTest.db` to create/edit/delete epics records.

## Building the IOC

Use `make` in the main direcotry.

## Running the IOC

After building the IOC, it can be run from `children/build/iocBoot/ioc-tst-ads/st.cmd`

## Before pushing to github

Clean the project with `make distclean`. `make clean` is not sufficient.
