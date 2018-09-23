# ETW on Production .NET systems

```
logman start demo -p {e13c0d23-ccbc-4e12-931b-d9cc2eee27e4} 0x1CCBD 0x5 -ets -ct perf
```

note: `{e13c0d23-ccbc-4e12-931b-d9cc2eee27e4}` refers to .NET Common Language Runtime, 
`0x1CCBD` is a magic number, and `0x5` represents VERBOSE.

## Troubleshooting ETW

Is .NET ETW providers registered?

```
PS C:\WINDOWS\system32> logman query providers | select-string \.NET

.NET Common Language Runtime             {E13C0D23-CCBC-4E12-931B-D9CC2EEE27E4}
ASP.NET Events                           {AFF081FE-0247-4275-9C4E-021F3DC1DA35}
```

If they are missing register providers with [wevtutil](https://docs.microsoft.com/en-us/dotnet/framework/performance/controlling-logging)

