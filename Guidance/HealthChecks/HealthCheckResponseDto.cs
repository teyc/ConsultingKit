    public class HealthCheckResponseDto
    {
        public enum HealthCheckStatus
        {
            Ok,
            NotOk
        }

        public HealthCheckStatus Status =>
            Subsystems == null || Subsystems.All(s => s.Status == HealthCheckStatus.Ok)
                ? HealthCheckStatus.Ok
                : HealthCheckStatus.NotOk;

        public string Name { get; set; }

        public string ExceptionMessage { get; set; }

        public string Instance { get; set; }

        public string Note { get; set; }

        public HealthCheckResponseDto[] Subsystems { get; set; }

    }
