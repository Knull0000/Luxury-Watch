package sanpham;
public class pc {
    private int pid,cid;

    public pc() {
    }

    public pc(int pid, int cid) {
        this.pid = pid;
        this.cid = cid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
    
}
