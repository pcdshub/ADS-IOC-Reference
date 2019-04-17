# ADS IOC example

An example ADS-based IOC with a paired TwinCAT3 solution.

All IOC adoption work was completed by mcbrowne.

## Configuring the IOC

You can edit the IOC's basic configuration options here: `iocBoot/templates/st.cmd`.
The following terms in `[BRACKETS]` with the information about the PLC your IOC is communicating with. 
`adsAsynPortDriverConfigure("ADS_1","[IP_ADDRESS]","[AMS_NET_ID]",851,1000, 0, 0, 500, 1000, 1000, 0)`
